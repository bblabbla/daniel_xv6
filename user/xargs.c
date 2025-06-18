#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/param.h"

int main(int argc, char *argv[]) {
  if (argc < 2) {
    fprintf(2, "Usage: xargs command [args...]\n");
    exit(1);
  }
  char buf[200];
  char *xargv[MAXARG];
  int base = argc - 1;
  for (int i = 0; i < base; i++)
    xargv[i] = argv[i + 1];
  xargv[base] = 0;
  int i = 0;
  while (1) {
    char ch;
    int n = read(0, &ch, 1);
    if (n < 0) {
      fprintf(2, "xargs: read error\n");
      exit(1);
    }
    if (n == 0) {
      if (i > 0) {
        buf[i] = 0;
        if (base + 1 < MAXARG) {
          xargv[base] = buf;
          xargv[base + 1] = 0;
          if (fork() == 0) {
            exec(xargv[0], xargv);
            fprintf(2, "xargs: exec %s failed\n", xargv[0]);
            exit(1);
          }
          wait(0);
        } else {
          fprintf(2, "xargs: too many arguments\n");
        }
      }
      break;
    }
    if (ch == '\n') {
      if (i > 0) {
        buf[i] = 0;
        if (base + 1 < MAXARG) {
          xargv[base] = buf;
          xargv[base + 1] = 0;
          if (fork() == 0) {
            exec(xargv[0], xargv);
            fprintf(2, "xargs: exec %s failed\n", xargv[0]);
            exit(1);
          }
          wait(0);
        } else {
          fprintf(2, "xargs: too many arguments\n");
        }
      }
      i = 0;
    } else {
      if (i < 200 - 1) {
        buf[i++] = ch;
      } else {
        fprintf(2, "xargs: input line too long\n");
        exit(1);
      }
    }
  }
  exit(0);
}