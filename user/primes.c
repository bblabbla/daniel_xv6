#include "kernel/types.h"
#include "user/user.h"
#include "kernel/stat.h"

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

void recursive_proc(int max, int prime, int talker) {
  print_prime(prime);
  int is_dad = 0, listener = -1;
  while (1) {
    int buf[1];
    if (read(talker, buf, sizeof(int)) <= 0) break;
    if (buf[0] % prime != 0) {
      if (!is_dad) {
        int apipe[2];
        pipe(apipe);
        is_dad = 1;
        listener = apipe[1];
        int pid = fork();
        if (pid == 0) {
          close(talker);
          close(apipe[1]);
          recursive_proc(max, buf[0], apipe[0]);
          exit(0);
        }
        close(apipe[0]);
      }
      write(listener, buf, sizeof(int));
    }
  }
  if (is_dad) {
    close(listener);
    wait(0);
  }
  close(talker);
  exit(0);
}

int main() {
  int first_pipe[2];
  pipe(first_pipe);
  if (fork() == 0) {
    close(first_pipe[1]);
    recursive_proc(35, 2, first_pipe[0]);
    exit(0);
  }
  close(first_pipe[0]);
  for (int i = 3; i <= 35; i++) {
    write(first_pipe[1], &i, sizeof(int));
  }
  close(first_pipe[1]);
  wait(0);
  printf("OK\n");
  exit(0);
}