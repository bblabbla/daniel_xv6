#include "kernel/types.h"
#include "user/user.h"

int main(int argc, char *argv[]) {
  if (argc == 1) {
    printf("too few arguments\n");
    exit(1);
  }
  sleep(atoi(argv[1]));
  exit(0);
}