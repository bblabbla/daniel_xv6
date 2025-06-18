
user/_primes:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <print_prime>:
#include "kernel/types.h"
#include "user/user.h"
#include "kernel/stat.h"

void print_prime(int n) {
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	1800                	addi	s0,sp,48
  char buf[16];
  int i = 0;
  buf[i++] = 'p';
   8:	07000793          	li	a5,112
   c:	fef40023          	sb	a5,-32(s0)
  buf[i++] = 'r';
  10:	07200793          	li	a5,114
  14:	fef400a3          	sb	a5,-31(s0)
  buf[i++] = 'i';
  18:	06900793          	li	a5,105
  1c:	fef40123          	sb	a5,-30(s0)
  buf[i++] = 'm';
  20:	06d00793          	li	a5,109
  24:	fef401a3          	sb	a5,-29(s0)
  buf[i++] = 'e';
  28:	06500793          	li	a5,101
  2c:	fef40223          	sb	a5,-28(s0)
  buf[i++] = ' ';
  30:	02000793          	li	a5,32
  34:	fef402a3          	sb	a5,-27(s0)
  char num[10];
  int j = 0;
  38:	fd040693          	addi	a3,s0,-48
  3c:	4701                	li	a4,0
  do {
    num[j++] = '0' + (n % 10);
  3e:	45a9                	li	a1,10
    n /= 10;
  } while (n > 0);
  40:	4825                	li	a6,9
    num[j++] = '0' + (n % 10);
  42:	863a                	mv	a2,a4
  44:	2705                	addiw	a4,a4,1
  46:	02b567bb          	remw	a5,a0,a1
  4a:	0307879b          	addiw	a5,a5,48
  4e:	00f68023          	sb	a5,0(a3)
    n /= 10;
  52:	87aa                	mv	a5,a0
  54:	02b5453b          	divw	a0,a0,a1
  } while (n > 0);
  58:	0685                	addi	a3,a3,1
  5a:	fef844e3          	blt	a6,a5,42 <print_prime+0x42>
  while (j--)
  5e:	cb21                	beqz	a4,ae <print_prime+0xae>
  60:	fd040793          	addi	a5,s0,-48
  64:	00c78733          	add	a4,a5,a2
  68:	fe640793          	addi	a5,s0,-26
  6c:	02061593          	slli	a1,a2,0x20
  70:	9181                	srli	a1,a1,0x20
  72:	fe740693          	addi	a3,s0,-25
  76:	95b6                	add	a1,a1,a3
    buf[i++] = num[j];
  78:	00074683          	lbu	a3,0(a4)
  7c:	00d78023          	sb	a3,0(a5)
  while (j--)
  80:	177d                	addi	a4,a4,-1
  82:	0785                	addi	a5,a5,1
  84:	feb79ae3          	bne	a5,a1,78 <print_prime+0x78>
  88:	261d                	addiw	a2,a2,7
  buf[i++] = '\n';
  8a:	ff040793          	addi	a5,s0,-16
  8e:	97b2                	add	a5,a5,a2
  90:	4729                	li	a4,10
  92:	fee78823          	sb	a4,-16(a5)
  write(1, buf, i);
  96:	2605                	addiw	a2,a2,1
  98:	fe040593          	addi	a1,s0,-32
  9c:	4505                	li	a0,1
  9e:	00000097          	auipc	ra,0x0
  a2:	44a080e7          	jalr	1098(ra) # 4e8 <write>
}
  a6:	70a2                	ld	ra,40(sp)
  a8:	7402                	ld	s0,32(sp)
  aa:	6145                	addi	sp,sp,48
  ac:	8082                	ret
  buf[i++] = ' ';
  ae:	4619                	li	a2,6
  b0:	bfe9                	j	8a <print_prime+0x8a>

00000000000000b2 <recursive_proc>:

void recursive_proc(int max, int prime, int talker) {
  b2:	715d                	addi	sp,sp,-80
  b4:	e486                	sd	ra,72(sp)
  b6:	e0a2                	sd	s0,64(sp)
  b8:	fc26                	sd	s1,56(sp)
  ba:	f84a                	sd	s2,48(sp)
  bc:	f44e                	sd	s3,40(sp)
  be:	f052                	sd	s4,32(sp)
  c0:	ec56                	sd	s5,24(sp)
  c2:	e85a                	sd	s6,16(sp)
  c4:	0880                	addi	s0,sp,80
  c6:	8b2a                	mv	s6,a0
  c8:	892e                	mv	s2,a1
  ca:	84b2                	mv	s1,a2
  print_prime(prime);
  cc:	852e                	mv	a0,a1
  ce:	00000097          	auipc	ra,0x0
  d2:	f32080e7          	jalr	-206(ra) # 0 <print_prime>
  int is_dad = 0, listener = -1;
  d6:	5a7d                	li	s4,-1
  d8:	4981                	li	s3,0
          recursive_proc(max, buf[0], apipe[0]);
          exit(0);
        }
        close(apipe[0]);
      }
      write(listener, buf, sizeof(int));
  da:	4a85                	li	s5,1
  dc:	a835                	j	118 <recursive_proc+0x66>
          close(talker);
  de:	8526                	mv	a0,s1
  e0:	00000097          	auipc	ra,0x0
  e4:	410080e7          	jalr	1040(ra) # 4f0 <close>
          close(apipe[1]);
  e8:	fbc42503          	lw	a0,-68(s0)
  ec:	00000097          	auipc	ra,0x0
  f0:	404080e7          	jalr	1028(ra) # 4f0 <close>
          recursive_proc(max, buf[0], apipe[0]);
  f4:	fb842603          	lw	a2,-72(s0)
  f8:	fb042583          	lw	a1,-80(s0)
  fc:	855a                	mv	a0,s6
  fe:	00000097          	auipc	ra,0x0
 102:	fb4080e7          	jalr	-76(ra) # b2 <recursive_proc>
      write(listener, buf, sizeof(int));
 106:	4611                	li	a2,4
 108:	fb040593          	addi	a1,s0,-80
 10c:	8552                	mv	a0,s4
 10e:	00000097          	auipc	ra,0x0
 112:	3da080e7          	jalr	986(ra) # 4e8 <write>
 116:	89d6                	mv	s3,s5
    if (read(talker, buf, sizeof(int)) <= 0) break;
 118:	4611                	li	a2,4
 11a:	fb040593          	addi	a1,s0,-80
 11e:	8526                	mv	a0,s1
 120:	00000097          	auipc	ra,0x0
 124:	3c0080e7          	jalr	960(ra) # 4e0 <read>
 128:	02a05d63          	blez	a0,162 <recursive_proc+0xb0>
    if (buf[0] % prime != 0) {
 12c:	fb042783          	lw	a5,-80(s0)
 130:	0327e7bb          	remw	a5,a5,s2
 134:	d3f5                	beqz	a5,118 <recursive_proc+0x66>
      if (!is_dad) {
 136:	fc0998e3          	bnez	s3,106 <recursive_proc+0x54>
        pipe(apipe);
 13a:	fb840513          	addi	a0,s0,-72
 13e:	00000097          	auipc	ra,0x0
 142:	39a080e7          	jalr	922(ra) # 4d8 <pipe>
        listener = apipe[1];
 146:	fbc42a03          	lw	s4,-68(s0)
        int pid = fork();
 14a:	00000097          	auipc	ra,0x0
 14e:	376080e7          	jalr	886(ra) # 4c0 <fork>
        if (pid == 0) {
 152:	d551                	beqz	a0,de <recursive_proc+0x2c>
        close(apipe[0]);
 154:	fb842503          	lw	a0,-72(s0)
 158:	00000097          	auipc	ra,0x0
 15c:	398080e7          	jalr	920(ra) # 4f0 <close>
 160:	b75d                	j	106 <recursive_proc+0x54>
    }
  }
  if (is_dad) {
 162:	00099c63          	bnez	s3,17a <recursive_proc+0xc8>
    close(listener);
    wait(0);
  }
  close(talker);
 166:	8526                	mv	a0,s1
 168:	00000097          	auipc	ra,0x0
 16c:	388080e7          	jalr	904(ra) # 4f0 <close>
  exit(0);
 170:	4501                	li	a0,0
 172:	00000097          	auipc	ra,0x0
 176:	356080e7          	jalr	854(ra) # 4c8 <exit>
    close(listener);
 17a:	8552                	mv	a0,s4
 17c:	00000097          	auipc	ra,0x0
 180:	374080e7          	jalr	884(ra) # 4f0 <close>
    wait(0);
 184:	4501                	li	a0,0
 186:	00000097          	auipc	ra,0x0
 18a:	34a080e7          	jalr	842(ra) # 4d0 <wait>
 18e:	bfe1                	j	166 <recursive_proc+0xb4>

0000000000000190 <main>:
}

int main() {
 190:	7179                	addi	sp,sp,-48
 192:	f406                	sd	ra,40(sp)
 194:	f022                	sd	s0,32(sp)
 196:	ec26                	sd	s1,24(sp)
 198:	1800                	addi	s0,sp,48
  int first_pipe[2];
  pipe(first_pipe);
 19a:	fd840513          	addi	a0,s0,-40
 19e:	00000097          	auipc	ra,0x0
 1a2:	33a080e7          	jalr	826(ra) # 4d8 <pipe>
  if (fork() == 0) {
 1a6:	00000097          	auipc	ra,0x0
 1aa:	31a080e7          	jalr	794(ra) # 4c0 <fork>
 1ae:	e105                	bnez	a0,1ce <main+0x3e>
    close(first_pipe[1]);
 1b0:	fdc42503          	lw	a0,-36(s0)
 1b4:	00000097          	auipc	ra,0x0
 1b8:	33c080e7          	jalr	828(ra) # 4f0 <close>
    recursive_proc(35, 2, first_pipe[0]);
 1bc:	fd842603          	lw	a2,-40(s0)
 1c0:	4589                	li	a1,2
 1c2:	02300513          	li	a0,35
 1c6:	00000097          	auipc	ra,0x0
 1ca:	eec080e7          	jalr	-276(ra) # b2 <recursive_proc>
    exit(0);
  }
  close(first_pipe[0]);
 1ce:	fd842503          	lw	a0,-40(s0)
 1d2:	00000097          	auipc	ra,0x0
 1d6:	31e080e7          	jalr	798(ra) # 4f0 <close>
  for (int i = 3; i <= 35; i++) {
 1da:	478d                	li	a5,3
 1dc:	fcf42a23          	sw	a5,-44(s0)
 1e0:	02300493          	li	s1,35
    write(first_pipe[1], &i, sizeof(int));
 1e4:	4611                	li	a2,4
 1e6:	fd440593          	addi	a1,s0,-44
 1ea:	fdc42503          	lw	a0,-36(s0)
 1ee:	00000097          	auipc	ra,0x0
 1f2:	2fa080e7          	jalr	762(ra) # 4e8 <write>
  for (int i = 3; i <= 35; i++) {
 1f6:	fd442783          	lw	a5,-44(s0)
 1fa:	2785                	addiw	a5,a5,1
 1fc:	0007871b          	sext.w	a4,a5
 200:	fcf42a23          	sw	a5,-44(s0)
 204:	fee4d0e3          	bge	s1,a4,1e4 <main+0x54>
  }
  close(first_pipe[1]);
 208:	fdc42503          	lw	a0,-36(s0)
 20c:	00000097          	auipc	ra,0x0
 210:	2e4080e7          	jalr	740(ra) # 4f0 <close>
  wait(0);
 214:	4501                	li	a0,0
 216:	00000097          	auipc	ra,0x0
 21a:	2ba080e7          	jalr	698(ra) # 4d0 <wait>
  printf("OK\n");
 21e:	00000517          	auipc	a0,0x0
 222:	7d250513          	addi	a0,a0,2002 # 9f0 <malloc+0xf2>
 226:	00000097          	auipc	ra,0x0
 22a:	61a080e7          	jalr	1562(ra) # 840 <printf>
  exit(0);
 22e:	4501                	li	a0,0
 230:	00000097          	auipc	ra,0x0
 234:	298080e7          	jalr	664(ra) # 4c8 <exit>

0000000000000238 <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
 238:	1141                	addi	sp,sp,-16
 23a:	e406                	sd	ra,8(sp)
 23c:	e022                	sd	s0,0(sp)
 23e:	0800                	addi	s0,sp,16
  extern int main();
  main();
 240:	00000097          	auipc	ra,0x0
 244:	f50080e7          	jalr	-176(ra) # 190 <main>
  exit(0);
 248:	4501                	li	a0,0
 24a:	00000097          	auipc	ra,0x0
 24e:	27e080e7          	jalr	638(ra) # 4c8 <exit>

0000000000000252 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 252:	1141                	addi	sp,sp,-16
 254:	e422                	sd	s0,8(sp)
 256:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 258:	87aa                	mv	a5,a0
 25a:	0585                	addi	a1,a1,1
 25c:	0785                	addi	a5,a5,1
 25e:	fff5c703          	lbu	a4,-1(a1)
 262:	fee78fa3          	sb	a4,-1(a5)
 266:	fb75                	bnez	a4,25a <strcpy+0x8>
    ;
  return os;
}
 268:	6422                	ld	s0,8(sp)
 26a:	0141                	addi	sp,sp,16
 26c:	8082                	ret

000000000000026e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 26e:	1141                	addi	sp,sp,-16
 270:	e422                	sd	s0,8(sp)
 272:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 274:	00054783          	lbu	a5,0(a0)
 278:	cb91                	beqz	a5,28c <strcmp+0x1e>
 27a:	0005c703          	lbu	a4,0(a1)
 27e:	00f71763          	bne	a4,a5,28c <strcmp+0x1e>
    p++, q++;
 282:	0505                	addi	a0,a0,1
 284:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 286:	00054783          	lbu	a5,0(a0)
 28a:	fbe5                	bnez	a5,27a <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 28c:	0005c503          	lbu	a0,0(a1)
}
 290:	40a7853b          	subw	a0,a5,a0
 294:	6422                	ld	s0,8(sp)
 296:	0141                	addi	sp,sp,16
 298:	8082                	ret

000000000000029a <strlen>:

uint
strlen(const char *s)
{
 29a:	1141                	addi	sp,sp,-16
 29c:	e422                	sd	s0,8(sp)
 29e:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 2a0:	00054783          	lbu	a5,0(a0)
 2a4:	cf91                	beqz	a5,2c0 <strlen+0x26>
 2a6:	0505                	addi	a0,a0,1
 2a8:	87aa                	mv	a5,a0
 2aa:	4685                	li	a3,1
 2ac:	9e89                	subw	a3,a3,a0
 2ae:	00f6853b          	addw	a0,a3,a5
 2b2:	0785                	addi	a5,a5,1
 2b4:	fff7c703          	lbu	a4,-1(a5)
 2b8:	fb7d                	bnez	a4,2ae <strlen+0x14>
    ;
  return n;
}
 2ba:	6422                	ld	s0,8(sp)
 2bc:	0141                	addi	sp,sp,16
 2be:	8082                	ret
  for(n = 0; s[n]; n++)
 2c0:	4501                	li	a0,0
 2c2:	bfe5                	j	2ba <strlen+0x20>

00000000000002c4 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2c4:	1141                	addi	sp,sp,-16
 2c6:	e422                	sd	s0,8(sp)
 2c8:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 2ca:	ce09                	beqz	a2,2e4 <memset+0x20>
 2cc:	87aa                	mv	a5,a0
 2ce:	fff6071b          	addiw	a4,a2,-1
 2d2:	1702                	slli	a4,a4,0x20
 2d4:	9301                	srli	a4,a4,0x20
 2d6:	0705                	addi	a4,a4,1
 2d8:	972a                	add	a4,a4,a0
    cdst[i] = c;
 2da:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 2de:	0785                	addi	a5,a5,1
 2e0:	fee79de3          	bne	a5,a4,2da <memset+0x16>
  }
  return dst;
}
 2e4:	6422                	ld	s0,8(sp)
 2e6:	0141                	addi	sp,sp,16
 2e8:	8082                	ret

00000000000002ea <strchr>:

char*
strchr(const char *s, char c)
{
 2ea:	1141                	addi	sp,sp,-16
 2ec:	e422                	sd	s0,8(sp)
 2ee:	0800                	addi	s0,sp,16
  for(; *s; s++)
 2f0:	00054783          	lbu	a5,0(a0)
 2f4:	cb99                	beqz	a5,30a <strchr+0x20>
    if(*s == c)
 2f6:	00f58763          	beq	a1,a5,304 <strchr+0x1a>
  for(; *s; s++)
 2fa:	0505                	addi	a0,a0,1
 2fc:	00054783          	lbu	a5,0(a0)
 300:	fbfd                	bnez	a5,2f6 <strchr+0xc>
      return (char*)s;
  return 0;
 302:	4501                	li	a0,0
}
 304:	6422                	ld	s0,8(sp)
 306:	0141                	addi	sp,sp,16
 308:	8082                	ret
  return 0;
 30a:	4501                	li	a0,0
 30c:	bfe5                	j	304 <strchr+0x1a>

000000000000030e <gets>:

char*
gets(char *buf, int max)
{
 30e:	711d                	addi	sp,sp,-96
 310:	ec86                	sd	ra,88(sp)
 312:	e8a2                	sd	s0,80(sp)
 314:	e4a6                	sd	s1,72(sp)
 316:	e0ca                	sd	s2,64(sp)
 318:	fc4e                	sd	s3,56(sp)
 31a:	f852                	sd	s4,48(sp)
 31c:	f456                	sd	s5,40(sp)
 31e:	f05a                	sd	s6,32(sp)
 320:	ec5e                	sd	s7,24(sp)
 322:	1080                	addi	s0,sp,96
 324:	8baa                	mv	s7,a0
 326:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 328:	892a                	mv	s2,a0
 32a:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 32c:	4aa9                	li	s5,10
 32e:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 330:	89a6                	mv	s3,s1
 332:	2485                	addiw	s1,s1,1
 334:	0344d863          	bge	s1,s4,364 <gets+0x56>
    cc = read(0, &c, 1);
 338:	4605                	li	a2,1
 33a:	faf40593          	addi	a1,s0,-81
 33e:	4501                	li	a0,0
 340:	00000097          	auipc	ra,0x0
 344:	1a0080e7          	jalr	416(ra) # 4e0 <read>
    if(cc < 1)
 348:	00a05e63          	blez	a0,364 <gets+0x56>
    buf[i++] = c;
 34c:	faf44783          	lbu	a5,-81(s0)
 350:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 354:	01578763          	beq	a5,s5,362 <gets+0x54>
 358:	0905                	addi	s2,s2,1
 35a:	fd679be3          	bne	a5,s6,330 <gets+0x22>
  for(i=0; i+1 < max; ){
 35e:	89a6                	mv	s3,s1
 360:	a011                	j	364 <gets+0x56>
 362:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 364:	99de                	add	s3,s3,s7
 366:	00098023          	sb	zero,0(s3)
  return buf;
}
 36a:	855e                	mv	a0,s7
 36c:	60e6                	ld	ra,88(sp)
 36e:	6446                	ld	s0,80(sp)
 370:	64a6                	ld	s1,72(sp)
 372:	6906                	ld	s2,64(sp)
 374:	79e2                	ld	s3,56(sp)
 376:	7a42                	ld	s4,48(sp)
 378:	7aa2                	ld	s5,40(sp)
 37a:	7b02                	ld	s6,32(sp)
 37c:	6be2                	ld	s7,24(sp)
 37e:	6125                	addi	sp,sp,96
 380:	8082                	ret

0000000000000382 <stat>:

int
stat(const char *n, struct stat *st)
{
 382:	1101                	addi	sp,sp,-32
 384:	ec06                	sd	ra,24(sp)
 386:	e822                	sd	s0,16(sp)
 388:	e426                	sd	s1,8(sp)
 38a:	e04a                	sd	s2,0(sp)
 38c:	1000                	addi	s0,sp,32
 38e:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 390:	4581                	li	a1,0
 392:	00000097          	auipc	ra,0x0
 396:	176080e7          	jalr	374(ra) # 508 <open>
  if(fd < 0)
 39a:	02054563          	bltz	a0,3c4 <stat+0x42>
 39e:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 3a0:	85ca                	mv	a1,s2
 3a2:	00000097          	auipc	ra,0x0
 3a6:	17e080e7          	jalr	382(ra) # 520 <fstat>
 3aa:	892a                	mv	s2,a0
  close(fd);
 3ac:	8526                	mv	a0,s1
 3ae:	00000097          	auipc	ra,0x0
 3b2:	142080e7          	jalr	322(ra) # 4f0 <close>
  return r;
}
 3b6:	854a                	mv	a0,s2
 3b8:	60e2                	ld	ra,24(sp)
 3ba:	6442                	ld	s0,16(sp)
 3bc:	64a2                	ld	s1,8(sp)
 3be:	6902                	ld	s2,0(sp)
 3c0:	6105                	addi	sp,sp,32
 3c2:	8082                	ret
    return -1;
 3c4:	597d                	li	s2,-1
 3c6:	bfc5                	j	3b6 <stat+0x34>

00000000000003c8 <atoi>:

int
atoi(const char *s)
{
 3c8:	1141                	addi	sp,sp,-16
 3ca:	e422                	sd	s0,8(sp)
 3cc:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3ce:	00054603          	lbu	a2,0(a0)
 3d2:	fd06079b          	addiw	a5,a2,-48
 3d6:	0ff7f793          	andi	a5,a5,255
 3da:	4725                	li	a4,9
 3dc:	02f76963          	bltu	a4,a5,40e <atoi+0x46>
 3e0:	86aa                	mv	a3,a0
  n = 0;
 3e2:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 3e4:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 3e6:	0685                	addi	a3,a3,1
 3e8:	0025179b          	slliw	a5,a0,0x2
 3ec:	9fa9                	addw	a5,a5,a0
 3ee:	0017979b          	slliw	a5,a5,0x1
 3f2:	9fb1                	addw	a5,a5,a2
 3f4:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 3f8:	0006c603          	lbu	a2,0(a3)
 3fc:	fd06071b          	addiw	a4,a2,-48
 400:	0ff77713          	andi	a4,a4,255
 404:	fee5f1e3          	bgeu	a1,a4,3e6 <atoi+0x1e>
  return n;
}
 408:	6422                	ld	s0,8(sp)
 40a:	0141                	addi	sp,sp,16
 40c:	8082                	ret
  n = 0;
 40e:	4501                	li	a0,0
 410:	bfe5                	j	408 <atoi+0x40>

0000000000000412 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 412:	1141                	addi	sp,sp,-16
 414:	e422                	sd	s0,8(sp)
 416:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 418:	02b57663          	bgeu	a0,a1,444 <memmove+0x32>
    while(n-- > 0)
 41c:	02c05163          	blez	a2,43e <memmove+0x2c>
 420:	fff6079b          	addiw	a5,a2,-1
 424:	1782                	slli	a5,a5,0x20
 426:	9381                	srli	a5,a5,0x20
 428:	0785                	addi	a5,a5,1
 42a:	97aa                	add	a5,a5,a0
  dst = vdst;
 42c:	872a                	mv	a4,a0
      *dst++ = *src++;
 42e:	0585                	addi	a1,a1,1
 430:	0705                	addi	a4,a4,1
 432:	fff5c683          	lbu	a3,-1(a1)
 436:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 43a:	fee79ae3          	bne	a5,a4,42e <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 43e:	6422                	ld	s0,8(sp)
 440:	0141                	addi	sp,sp,16
 442:	8082                	ret
    dst += n;
 444:	00c50733          	add	a4,a0,a2
    src += n;
 448:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 44a:	fec05ae3          	blez	a2,43e <memmove+0x2c>
 44e:	fff6079b          	addiw	a5,a2,-1
 452:	1782                	slli	a5,a5,0x20
 454:	9381                	srli	a5,a5,0x20
 456:	fff7c793          	not	a5,a5
 45a:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 45c:	15fd                	addi	a1,a1,-1
 45e:	177d                	addi	a4,a4,-1
 460:	0005c683          	lbu	a3,0(a1)
 464:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 468:	fee79ae3          	bne	a5,a4,45c <memmove+0x4a>
 46c:	bfc9                	j	43e <memmove+0x2c>

000000000000046e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 46e:	1141                	addi	sp,sp,-16
 470:	e422                	sd	s0,8(sp)
 472:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 474:	ca05                	beqz	a2,4a4 <memcmp+0x36>
 476:	fff6069b          	addiw	a3,a2,-1
 47a:	1682                	slli	a3,a3,0x20
 47c:	9281                	srli	a3,a3,0x20
 47e:	0685                	addi	a3,a3,1
 480:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 482:	00054783          	lbu	a5,0(a0)
 486:	0005c703          	lbu	a4,0(a1)
 48a:	00e79863          	bne	a5,a4,49a <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 48e:	0505                	addi	a0,a0,1
    p2++;
 490:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 492:	fed518e3          	bne	a0,a3,482 <memcmp+0x14>
  }
  return 0;
 496:	4501                	li	a0,0
 498:	a019                	j	49e <memcmp+0x30>
      return *p1 - *p2;
 49a:	40e7853b          	subw	a0,a5,a4
}
 49e:	6422                	ld	s0,8(sp)
 4a0:	0141                	addi	sp,sp,16
 4a2:	8082                	ret
  return 0;
 4a4:	4501                	li	a0,0
 4a6:	bfe5                	j	49e <memcmp+0x30>

00000000000004a8 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4a8:	1141                	addi	sp,sp,-16
 4aa:	e406                	sd	ra,8(sp)
 4ac:	e022                	sd	s0,0(sp)
 4ae:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 4b0:	00000097          	auipc	ra,0x0
 4b4:	f62080e7          	jalr	-158(ra) # 412 <memmove>
}
 4b8:	60a2                	ld	ra,8(sp)
 4ba:	6402                	ld	s0,0(sp)
 4bc:	0141                	addi	sp,sp,16
 4be:	8082                	ret

00000000000004c0 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 4c0:	4885                	li	a7,1
 ecall
 4c2:	00000073          	ecall
 ret
 4c6:	8082                	ret

00000000000004c8 <exit>:
.global exit
exit:
 li a7, SYS_exit
 4c8:	4889                	li	a7,2
 ecall
 4ca:	00000073          	ecall
 ret
 4ce:	8082                	ret

00000000000004d0 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4d0:	488d                	li	a7,3
 ecall
 4d2:	00000073          	ecall
 ret
 4d6:	8082                	ret

00000000000004d8 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4d8:	4891                	li	a7,4
 ecall
 4da:	00000073          	ecall
 ret
 4de:	8082                	ret

00000000000004e0 <read>:
.global read
read:
 li a7, SYS_read
 4e0:	4895                	li	a7,5
 ecall
 4e2:	00000073          	ecall
 ret
 4e6:	8082                	ret

00000000000004e8 <write>:
.global write
write:
 li a7, SYS_write
 4e8:	48c1                	li	a7,16
 ecall
 4ea:	00000073          	ecall
 ret
 4ee:	8082                	ret

00000000000004f0 <close>:
.global close
close:
 li a7, SYS_close
 4f0:	48d5                	li	a7,21
 ecall
 4f2:	00000073          	ecall
 ret
 4f6:	8082                	ret

00000000000004f8 <kill>:
.global kill
kill:
 li a7, SYS_kill
 4f8:	4899                	li	a7,6
 ecall
 4fa:	00000073          	ecall
 ret
 4fe:	8082                	ret

0000000000000500 <exec>:
.global exec
exec:
 li a7, SYS_exec
 500:	489d                	li	a7,7
 ecall
 502:	00000073          	ecall
 ret
 506:	8082                	ret

0000000000000508 <open>:
.global open
open:
 li a7, SYS_open
 508:	48bd                	li	a7,15
 ecall
 50a:	00000073          	ecall
 ret
 50e:	8082                	ret

0000000000000510 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 510:	48c5                	li	a7,17
 ecall
 512:	00000073          	ecall
 ret
 516:	8082                	ret

0000000000000518 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 518:	48c9                	li	a7,18
 ecall
 51a:	00000073          	ecall
 ret
 51e:	8082                	ret

0000000000000520 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 520:	48a1                	li	a7,8
 ecall
 522:	00000073          	ecall
 ret
 526:	8082                	ret

0000000000000528 <link>:
.global link
link:
 li a7, SYS_link
 528:	48cd                	li	a7,19
 ecall
 52a:	00000073          	ecall
 ret
 52e:	8082                	ret

0000000000000530 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 530:	48d1                	li	a7,20
 ecall
 532:	00000073          	ecall
 ret
 536:	8082                	ret

0000000000000538 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 538:	48a5                	li	a7,9
 ecall
 53a:	00000073          	ecall
 ret
 53e:	8082                	ret

0000000000000540 <dup>:
.global dup
dup:
 li a7, SYS_dup
 540:	48a9                	li	a7,10
 ecall
 542:	00000073          	ecall
 ret
 546:	8082                	ret

0000000000000548 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 548:	48ad                	li	a7,11
 ecall
 54a:	00000073          	ecall
 ret
 54e:	8082                	ret

0000000000000550 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 550:	48b1                	li	a7,12
 ecall
 552:	00000073          	ecall
 ret
 556:	8082                	ret

0000000000000558 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 558:	48b5                	li	a7,13
 ecall
 55a:	00000073          	ecall
 ret
 55e:	8082                	ret

0000000000000560 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 560:	48b9                	li	a7,14
 ecall
 562:	00000073          	ecall
 ret
 566:	8082                	ret

0000000000000568 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 568:	1101                	addi	sp,sp,-32
 56a:	ec06                	sd	ra,24(sp)
 56c:	e822                	sd	s0,16(sp)
 56e:	1000                	addi	s0,sp,32
 570:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 574:	4605                	li	a2,1
 576:	fef40593          	addi	a1,s0,-17
 57a:	00000097          	auipc	ra,0x0
 57e:	f6e080e7          	jalr	-146(ra) # 4e8 <write>
}
 582:	60e2                	ld	ra,24(sp)
 584:	6442                	ld	s0,16(sp)
 586:	6105                	addi	sp,sp,32
 588:	8082                	ret

000000000000058a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 58a:	7139                	addi	sp,sp,-64
 58c:	fc06                	sd	ra,56(sp)
 58e:	f822                	sd	s0,48(sp)
 590:	f426                	sd	s1,40(sp)
 592:	f04a                	sd	s2,32(sp)
 594:	ec4e                	sd	s3,24(sp)
 596:	0080                	addi	s0,sp,64
 598:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 59a:	c299                	beqz	a3,5a0 <printint+0x16>
 59c:	0805c863          	bltz	a1,62c <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5a0:	2581                	sext.w	a1,a1
  neg = 0;
 5a2:	4881                	li	a7,0
 5a4:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 5a8:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 5aa:	2601                	sext.w	a2,a2
 5ac:	00000517          	auipc	a0,0x0
 5b0:	45450513          	addi	a0,a0,1108 # a00 <digits>
 5b4:	883a                	mv	a6,a4
 5b6:	2705                	addiw	a4,a4,1
 5b8:	02c5f7bb          	remuw	a5,a1,a2
 5bc:	1782                	slli	a5,a5,0x20
 5be:	9381                	srli	a5,a5,0x20
 5c0:	97aa                	add	a5,a5,a0
 5c2:	0007c783          	lbu	a5,0(a5)
 5c6:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5ca:	0005879b          	sext.w	a5,a1
 5ce:	02c5d5bb          	divuw	a1,a1,a2
 5d2:	0685                	addi	a3,a3,1
 5d4:	fec7f0e3          	bgeu	a5,a2,5b4 <printint+0x2a>
  if(neg)
 5d8:	00088b63          	beqz	a7,5ee <printint+0x64>
    buf[i++] = '-';
 5dc:	fd040793          	addi	a5,s0,-48
 5e0:	973e                	add	a4,a4,a5
 5e2:	02d00793          	li	a5,45
 5e6:	fef70823          	sb	a5,-16(a4)
 5ea:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5ee:	02e05863          	blez	a4,61e <printint+0x94>
 5f2:	fc040793          	addi	a5,s0,-64
 5f6:	00e78933          	add	s2,a5,a4
 5fa:	fff78993          	addi	s3,a5,-1
 5fe:	99ba                	add	s3,s3,a4
 600:	377d                	addiw	a4,a4,-1
 602:	1702                	slli	a4,a4,0x20
 604:	9301                	srli	a4,a4,0x20
 606:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 60a:	fff94583          	lbu	a1,-1(s2)
 60e:	8526                	mv	a0,s1
 610:	00000097          	auipc	ra,0x0
 614:	f58080e7          	jalr	-168(ra) # 568 <putc>
  while(--i >= 0)
 618:	197d                	addi	s2,s2,-1
 61a:	ff3918e3          	bne	s2,s3,60a <printint+0x80>
}
 61e:	70e2                	ld	ra,56(sp)
 620:	7442                	ld	s0,48(sp)
 622:	74a2                	ld	s1,40(sp)
 624:	7902                	ld	s2,32(sp)
 626:	69e2                	ld	s3,24(sp)
 628:	6121                	addi	sp,sp,64
 62a:	8082                	ret
    x = -xx;
 62c:	40b005bb          	negw	a1,a1
    neg = 1;
 630:	4885                	li	a7,1
    x = -xx;
 632:	bf8d                	j	5a4 <printint+0x1a>

0000000000000634 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 634:	7119                	addi	sp,sp,-128
 636:	fc86                	sd	ra,120(sp)
 638:	f8a2                	sd	s0,112(sp)
 63a:	f4a6                	sd	s1,104(sp)
 63c:	f0ca                	sd	s2,96(sp)
 63e:	ecce                	sd	s3,88(sp)
 640:	e8d2                	sd	s4,80(sp)
 642:	e4d6                	sd	s5,72(sp)
 644:	e0da                	sd	s6,64(sp)
 646:	fc5e                	sd	s7,56(sp)
 648:	f862                	sd	s8,48(sp)
 64a:	f466                	sd	s9,40(sp)
 64c:	f06a                	sd	s10,32(sp)
 64e:	ec6e                	sd	s11,24(sp)
 650:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 652:	0005c903          	lbu	s2,0(a1)
 656:	18090f63          	beqz	s2,7f4 <vprintf+0x1c0>
 65a:	8aaa                	mv	s5,a0
 65c:	8b32                	mv	s6,a2
 65e:	00158493          	addi	s1,a1,1
  state = 0;
 662:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 664:	02500a13          	li	s4,37
      if(c == 'd'){
 668:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 66c:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 670:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 674:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 678:	00000b97          	auipc	s7,0x0
 67c:	388b8b93          	addi	s7,s7,904 # a00 <digits>
 680:	a839                	j	69e <vprintf+0x6a>
        putc(fd, c);
 682:	85ca                	mv	a1,s2
 684:	8556                	mv	a0,s5
 686:	00000097          	auipc	ra,0x0
 68a:	ee2080e7          	jalr	-286(ra) # 568 <putc>
 68e:	a019                	j	694 <vprintf+0x60>
    } else if(state == '%'){
 690:	01498f63          	beq	s3,s4,6ae <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 694:	0485                	addi	s1,s1,1
 696:	fff4c903          	lbu	s2,-1(s1)
 69a:	14090d63          	beqz	s2,7f4 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 69e:	0009079b          	sext.w	a5,s2
    if(state == 0){
 6a2:	fe0997e3          	bnez	s3,690 <vprintf+0x5c>
      if(c == '%'){
 6a6:	fd479ee3          	bne	a5,s4,682 <vprintf+0x4e>
        state = '%';
 6aa:	89be                	mv	s3,a5
 6ac:	b7e5                	j	694 <vprintf+0x60>
      if(c == 'd'){
 6ae:	05878063          	beq	a5,s8,6ee <vprintf+0xba>
      } else if(c == 'l') {
 6b2:	05978c63          	beq	a5,s9,70a <vprintf+0xd6>
      } else if(c == 'x') {
 6b6:	07a78863          	beq	a5,s10,726 <vprintf+0xf2>
      } else if(c == 'p') {
 6ba:	09b78463          	beq	a5,s11,742 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 6be:	07300713          	li	a4,115
 6c2:	0ce78663          	beq	a5,a4,78e <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6c6:	06300713          	li	a4,99
 6ca:	0ee78e63          	beq	a5,a4,7c6 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 6ce:	11478863          	beq	a5,s4,7de <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6d2:	85d2                	mv	a1,s4
 6d4:	8556                	mv	a0,s5
 6d6:	00000097          	auipc	ra,0x0
 6da:	e92080e7          	jalr	-366(ra) # 568 <putc>
        putc(fd, c);
 6de:	85ca                	mv	a1,s2
 6e0:	8556                	mv	a0,s5
 6e2:	00000097          	auipc	ra,0x0
 6e6:	e86080e7          	jalr	-378(ra) # 568 <putc>
      }
      state = 0;
 6ea:	4981                	li	s3,0
 6ec:	b765                	j	694 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 6ee:	008b0913          	addi	s2,s6,8
 6f2:	4685                	li	a3,1
 6f4:	4629                	li	a2,10
 6f6:	000b2583          	lw	a1,0(s6)
 6fa:	8556                	mv	a0,s5
 6fc:	00000097          	auipc	ra,0x0
 700:	e8e080e7          	jalr	-370(ra) # 58a <printint>
 704:	8b4a                	mv	s6,s2
      state = 0;
 706:	4981                	li	s3,0
 708:	b771                	j	694 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 70a:	008b0913          	addi	s2,s6,8
 70e:	4681                	li	a3,0
 710:	4629                	li	a2,10
 712:	000b2583          	lw	a1,0(s6)
 716:	8556                	mv	a0,s5
 718:	00000097          	auipc	ra,0x0
 71c:	e72080e7          	jalr	-398(ra) # 58a <printint>
 720:	8b4a                	mv	s6,s2
      state = 0;
 722:	4981                	li	s3,0
 724:	bf85                	j	694 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 726:	008b0913          	addi	s2,s6,8
 72a:	4681                	li	a3,0
 72c:	4641                	li	a2,16
 72e:	000b2583          	lw	a1,0(s6)
 732:	8556                	mv	a0,s5
 734:	00000097          	auipc	ra,0x0
 738:	e56080e7          	jalr	-426(ra) # 58a <printint>
 73c:	8b4a                	mv	s6,s2
      state = 0;
 73e:	4981                	li	s3,0
 740:	bf91                	j	694 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 742:	008b0793          	addi	a5,s6,8
 746:	f8f43423          	sd	a5,-120(s0)
 74a:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 74e:	03000593          	li	a1,48
 752:	8556                	mv	a0,s5
 754:	00000097          	auipc	ra,0x0
 758:	e14080e7          	jalr	-492(ra) # 568 <putc>
  putc(fd, 'x');
 75c:	85ea                	mv	a1,s10
 75e:	8556                	mv	a0,s5
 760:	00000097          	auipc	ra,0x0
 764:	e08080e7          	jalr	-504(ra) # 568 <putc>
 768:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 76a:	03c9d793          	srli	a5,s3,0x3c
 76e:	97de                	add	a5,a5,s7
 770:	0007c583          	lbu	a1,0(a5)
 774:	8556                	mv	a0,s5
 776:	00000097          	auipc	ra,0x0
 77a:	df2080e7          	jalr	-526(ra) # 568 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 77e:	0992                	slli	s3,s3,0x4
 780:	397d                	addiw	s2,s2,-1
 782:	fe0914e3          	bnez	s2,76a <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 786:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 78a:	4981                	li	s3,0
 78c:	b721                	j	694 <vprintf+0x60>
        s = va_arg(ap, char*);
 78e:	008b0993          	addi	s3,s6,8
 792:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 796:	02090163          	beqz	s2,7b8 <vprintf+0x184>
        while(*s != 0){
 79a:	00094583          	lbu	a1,0(s2)
 79e:	c9a1                	beqz	a1,7ee <vprintf+0x1ba>
          putc(fd, *s);
 7a0:	8556                	mv	a0,s5
 7a2:	00000097          	auipc	ra,0x0
 7a6:	dc6080e7          	jalr	-570(ra) # 568 <putc>
          s++;
 7aa:	0905                	addi	s2,s2,1
        while(*s != 0){
 7ac:	00094583          	lbu	a1,0(s2)
 7b0:	f9e5                	bnez	a1,7a0 <vprintf+0x16c>
        s = va_arg(ap, char*);
 7b2:	8b4e                	mv	s6,s3
      state = 0;
 7b4:	4981                	li	s3,0
 7b6:	bdf9                	j	694 <vprintf+0x60>
          s = "(null)";
 7b8:	00000917          	auipc	s2,0x0
 7bc:	24090913          	addi	s2,s2,576 # 9f8 <malloc+0xfa>
        while(*s != 0){
 7c0:	02800593          	li	a1,40
 7c4:	bff1                	j	7a0 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 7c6:	008b0913          	addi	s2,s6,8
 7ca:	000b4583          	lbu	a1,0(s6)
 7ce:	8556                	mv	a0,s5
 7d0:	00000097          	auipc	ra,0x0
 7d4:	d98080e7          	jalr	-616(ra) # 568 <putc>
 7d8:	8b4a                	mv	s6,s2
      state = 0;
 7da:	4981                	li	s3,0
 7dc:	bd65                	j	694 <vprintf+0x60>
        putc(fd, c);
 7de:	85d2                	mv	a1,s4
 7e0:	8556                	mv	a0,s5
 7e2:	00000097          	auipc	ra,0x0
 7e6:	d86080e7          	jalr	-634(ra) # 568 <putc>
      state = 0;
 7ea:	4981                	li	s3,0
 7ec:	b565                	j	694 <vprintf+0x60>
        s = va_arg(ap, char*);
 7ee:	8b4e                	mv	s6,s3
      state = 0;
 7f0:	4981                	li	s3,0
 7f2:	b54d                	j	694 <vprintf+0x60>
    }
  }
}
 7f4:	70e6                	ld	ra,120(sp)
 7f6:	7446                	ld	s0,112(sp)
 7f8:	74a6                	ld	s1,104(sp)
 7fa:	7906                	ld	s2,96(sp)
 7fc:	69e6                	ld	s3,88(sp)
 7fe:	6a46                	ld	s4,80(sp)
 800:	6aa6                	ld	s5,72(sp)
 802:	6b06                	ld	s6,64(sp)
 804:	7be2                	ld	s7,56(sp)
 806:	7c42                	ld	s8,48(sp)
 808:	7ca2                	ld	s9,40(sp)
 80a:	7d02                	ld	s10,32(sp)
 80c:	6de2                	ld	s11,24(sp)
 80e:	6109                	addi	sp,sp,128
 810:	8082                	ret

0000000000000812 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 812:	715d                	addi	sp,sp,-80
 814:	ec06                	sd	ra,24(sp)
 816:	e822                	sd	s0,16(sp)
 818:	1000                	addi	s0,sp,32
 81a:	e010                	sd	a2,0(s0)
 81c:	e414                	sd	a3,8(s0)
 81e:	e818                	sd	a4,16(s0)
 820:	ec1c                	sd	a5,24(s0)
 822:	03043023          	sd	a6,32(s0)
 826:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 82a:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 82e:	8622                	mv	a2,s0
 830:	00000097          	auipc	ra,0x0
 834:	e04080e7          	jalr	-508(ra) # 634 <vprintf>
}
 838:	60e2                	ld	ra,24(sp)
 83a:	6442                	ld	s0,16(sp)
 83c:	6161                	addi	sp,sp,80
 83e:	8082                	ret

0000000000000840 <printf>:

void
printf(const char *fmt, ...)
{
 840:	711d                	addi	sp,sp,-96
 842:	ec06                	sd	ra,24(sp)
 844:	e822                	sd	s0,16(sp)
 846:	1000                	addi	s0,sp,32
 848:	e40c                	sd	a1,8(s0)
 84a:	e810                	sd	a2,16(s0)
 84c:	ec14                	sd	a3,24(s0)
 84e:	f018                	sd	a4,32(s0)
 850:	f41c                	sd	a5,40(s0)
 852:	03043823          	sd	a6,48(s0)
 856:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 85a:	00840613          	addi	a2,s0,8
 85e:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 862:	85aa                	mv	a1,a0
 864:	4505                	li	a0,1
 866:	00000097          	auipc	ra,0x0
 86a:	dce080e7          	jalr	-562(ra) # 634 <vprintf>
}
 86e:	60e2                	ld	ra,24(sp)
 870:	6442                	ld	s0,16(sp)
 872:	6125                	addi	sp,sp,96
 874:	8082                	ret

0000000000000876 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 876:	1141                	addi	sp,sp,-16
 878:	e422                	sd	s0,8(sp)
 87a:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 87c:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 880:	00000797          	auipc	a5,0x0
 884:	7807b783          	ld	a5,1920(a5) # 1000 <freep>
 888:	a805                	j	8b8 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 88a:	4618                	lw	a4,8(a2)
 88c:	9db9                	addw	a1,a1,a4
 88e:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 892:	6398                	ld	a4,0(a5)
 894:	6318                	ld	a4,0(a4)
 896:	fee53823          	sd	a4,-16(a0)
 89a:	a091                	j	8de <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 89c:	ff852703          	lw	a4,-8(a0)
 8a0:	9e39                	addw	a2,a2,a4
 8a2:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 8a4:	ff053703          	ld	a4,-16(a0)
 8a8:	e398                	sd	a4,0(a5)
 8aa:	a099                	j	8f0 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ac:	6398                	ld	a4,0(a5)
 8ae:	00e7e463          	bltu	a5,a4,8b6 <free+0x40>
 8b2:	00e6ea63          	bltu	a3,a4,8c6 <free+0x50>
{
 8b6:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b8:	fed7fae3          	bgeu	a5,a3,8ac <free+0x36>
 8bc:	6398                	ld	a4,0(a5)
 8be:	00e6e463          	bltu	a3,a4,8c6 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c2:	fee7eae3          	bltu	a5,a4,8b6 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 8c6:	ff852583          	lw	a1,-8(a0)
 8ca:	6390                	ld	a2,0(a5)
 8cc:	02059713          	slli	a4,a1,0x20
 8d0:	9301                	srli	a4,a4,0x20
 8d2:	0712                	slli	a4,a4,0x4
 8d4:	9736                	add	a4,a4,a3
 8d6:	fae60ae3          	beq	a2,a4,88a <free+0x14>
    bp->s.ptr = p->s.ptr;
 8da:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8de:	4790                	lw	a2,8(a5)
 8e0:	02061713          	slli	a4,a2,0x20
 8e4:	9301                	srli	a4,a4,0x20
 8e6:	0712                	slli	a4,a4,0x4
 8e8:	973e                	add	a4,a4,a5
 8ea:	fae689e3          	beq	a3,a4,89c <free+0x26>
  } else
    p->s.ptr = bp;
 8ee:	e394                	sd	a3,0(a5)
  freep = p;
 8f0:	00000717          	auipc	a4,0x0
 8f4:	70f73823          	sd	a5,1808(a4) # 1000 <freep>
}
 8f8:	6422                	ld	s0,8(sp)
 8fa:	0141                	addi	sp,sp,16
 8fc:	8082                	ret

00000000000008fe <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8fe:	7139                	addi	sp,sp,-64
 900:	fc06                	sd	ra,56(sp)
 902:	f822                	sd	s0,48(sp)
 904:	f426                	sd	s1,40(sp)
 906:	f04a                	sd	s2,32(sp)
 908:	ec4e                	sd	s3,24(sp)
 90a:	e852                	sd	s4,16(sp)
 90c:	e456                	sd	s5,8(sp)
 90e:	e05a                	sd	s6,0(sp)
 910:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 912:	02051493          	slli	s1,a0,0x20
 916:	9081                	srli	s1,s1,0x20
 918:	04bd                	addi	s1,s1,15
 91a:	8091                	srli	s1,s1,0x4
 91c:	0014899b          	addiw	s3,s1,1
 920:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 922:	00000517          	auipc	a0,0x0
 926:	6de53503          	ld	a0,1758(a0) # 1000 <freep>
 92a:	c515                	beqz	a0,956 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 92e:	4798                	lw	a4,8(a5)
 930:	02977f63          	bgeu	a4,s1,96e <malloc+0x70>
 934:	8a4e                	mv	s4,s3
 936:	0009871b          	sext.w	a4,s3
 93a:	6685                	lui	a3,0x1
 93c:	00d77363          	bgeu	a4,a3,942 <malloc+0x44>
 940:	6a05                	lui	s4,0x1
 942:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 946:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 94a:	00000917          	auipc	s2,0x0
 94e:	6b690913          	addi	s2,s2,1718 # 1000 <freep>
  if(p == (char*)-1)
 952:	5afd                	li	s5,-1
 954:	a88d                	j	9c6 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 956:	00000797          	auipc	a5,0x0
 95a:	6ba78793          	addi	a5,a5,1722 # 1010 <base>
 95e:	00000717          	auipc	a4,0x0
 962:	6af73123          	sd	a5,1698(a4) # 1000 <freep>
 966:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 968:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 96c:	b7e1                	j	934 <malloc+0x36>
      if(p->s.size == nunits)
 96e:	02e48b63          	beq	s1,a4,9a4 <malloc+0xa6>
        p->s.size -= nunits;
 972:	4137073b          	subw	a4,a4,s3
 976:	c798                	sw	a4,8(a5)
        p += p->s.size;
 978:	1702                	slli	a4,a4,0x20
 97a:	9301                	srli	a4,a4,0x20
 97c:	0712                	slli	a4,a4,0x4
 97e:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 980:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 984:	00000717          	auipc	a4,0x0
 988:	66a73e23          	sd	a0,1660(a4) # 1000 <freep>
      return (void*)(p + 1);
 98c:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 990:	70e2                	ld	ra,56(sp)
 992:	7442                	ld	s0,48(sp)
 994:	74a2                	ld	s1,40(sp)
 996:	7902                	ld	s2,32(sp)
 998:	69e2                	ld	s3,24(sp)
 99a:	6a42                	ld	s4,16(sp)
 99c:	6aa2                	ld	s5,8(sp)
 99e:	6b02                	ld	s6,0(sp)
 9a0:	6121                	addi	sp,sp,64
 9a2:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 9a4:	6398                	ld	a4,0(a5)
 9a6:	e118                	sd	a4,0(a0)
 9a8:	bff1                	j	984 <malloc+0x86>
  hp->s.size = nu;
 9aa:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 9ae:	0541                	addi	a0,a0,16
 9b0:	00000097          	auipc	ra,0x0
 9b4:	ec6080e7          	jalr	-314(ra) # 876 <free>
  return freep;
 9b8:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 9bc:	d971                	beqz	a0,990 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9be:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9c0:	4798                	lw	a4,8(a5)
 9c2:	fa9776e3          	bgeu	a4,s1,96e <malloc+0x70>
    if(p == freep)
 9c6:	00093703          	ld	a4,0(s2)
 9ca:	853e                	mv	a0,a5
 9cc:	fef719e3          	bne	a4,a5,9be <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 9d0:	8552                	mv	a0,s4
 9d2:	00000097          	auipc	ra,0x0
 9d6:	b7e080e7          	jalr	-1154(ra) # 550 <sbrk>
  if(p == (char*)-1)
 9da:	fd5518e3          	bne	a0,s5,9aa <malloc+0xac>
        return 0;
 9de:	4501                	li	a0,0
 9e0:	bf45                	j	990 <malloc+0x92>
