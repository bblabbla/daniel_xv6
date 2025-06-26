#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

void print_prime(int n) {
  char buf[16];
  int i = 0;
  buf[i++] = 'p';
  buf[i++] = 'r';
  buf[i++] = 'i';
  buf[i++] = 'm';
  buf[i++] = 'e';
  buf[i++] = ' ';
  char num[10];
  int j = 0;
  do {
    num[j++] = '0' + (n % 10);
    n /= 10;
  } while (n > 0);
  while (j--)
    buf[i++] = num[j];
  buf[i++] = '\n';
  write(1, buf, i);
}

void recursive_proc(int prime, int read_fd) {
  print_prime(prime);
  int is_child_created = 0, next_fd = -1;
  while (1) {
    int n;
    if (read(read_fd, &n, sizeof(int)) <= 0)
      break;
    if (n % prime != 0) {
      if (!is_child_created) {
        int pipe_fd[2];
        pipe(pipe_fd);
        is_child_created = 1;
        next_fd = pipe_fd[1];
        int pid = fork();
        if (pid == 0) {
          close(read_fd);
          close(pipe_fd[1]);
          recursive_proc(n, pipe_fd[0]);
          exit(0);
        }
        close(pipe_fd[0]);
      }
      write(next_fd, &n, sizeof(int));
    }
  }
  if (is_child_created) {
    close(next_fd);
    wait(0);
  }
  close(read_fd);
  exit(0);
}

int main() {
  int pipe_fd[2];
  pipe(pipe_fd);
  if (fork() == 0) {
    close(pipe_fd[1]);
    recursive_proc(2, pipe_fd[0]);
    exit(0);
  }
  close(pipe_fd[0]);
  for (int i = 3; i <= 35; i++) {
    write(pipe_fd[1], &i, sizeof(int));
  }
  close(pipe_fd[1]);
  wait(0);
  printf("OK\n");
  exit(0);
}