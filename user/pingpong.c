#include "kernel/types.h"
#include "user/user.h"
#include "kernel/stat.h"

int main() {
  int p[2];
  int q[2];
  char buf[1] = {'a'};
  pipe(p);
  pipe(q);
  int pid = fork();
  if (pid == 0) {
    read(p[0], buf, 1);
    printf("%d: received ping\n", getpid());
    write(q[1], buf, 1);
  } else {
    write(p[1], buf, 1);
    read(q[0], buf, 1);
    printf("%d: received pong\n", getpid());
  }
  close(p[0]);
  close(p[1]);
  close(q[0]);
  close(q[1]);
  exit(0);
}