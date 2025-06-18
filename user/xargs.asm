
user/_xargs:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/param.h"

int main(int argc, char *argv[]) {
   0:	de010113          	addi	sp,sp,-544
   4:	20113c23          	sd	ra,536(sp)
   8:	20813823          	sd	s0,528(sp)
   c:	20913423          	sd	s1,520(sp)
  10:	21213023          	sd	s2,512(sp)
  14:	ffce                	sd	s3,504(sp)
  16:	fbd2                	sd	s4,496(sp)
  18:	f7d6                	sd	s5,488(sp)
  1a:	f3da                	sd	s6,480(sp)
  1c:	efde                	sd	s7,472(sp)
  1e:	1400                	addi	s0,sp,544
  if (argc < 2) {
  20:	4785                	li	a5,1
  22:	04a7d863          	bge	a5,a0,72 <main+0x72>
  26:	892a                	mv	s2,a0
    fprintf(2, "Usage: xargs command [args...]\n");
    exit(1);
  }
  char buf[200];
  char *xargv[MAXARG];
  int base = argc - 1;
  28:	fff5099b          	addiw	s3,a0,-1
  for (int i = 0; i < base; i++)
  2c:	05a1                	addi	a1,a1,8
  2e:	de840793          	addi	a5,s0,-536
  32:	ffe5069b          	addiw	a3,a0,-2
  36:	1682                	slli	a3,a3,0x20
  38:	9281                	srli	a3,a3,0x20
  3a:	068e                	slli	a3,a3,0x3
  3c:	df040713          	addi	a4,s0,-528
  40:	96ba                	add	a3,a3,a4
    xargv[i] = argv[i + 1];
  42:	6198                	ld	a4,0(a1)
  44:	e398                	sd	a4,0(a5)
  for (int i = 0; i < base; i++)
  46:	05a1                	addi	a1,a1,8
  48:	07a1                	addi	a5,a5,8
  4a:	fed79ce3          	bne	a5,a3,42 <main+0x42>
  xargv[base] = 0;
  4e:	00399793          	slli	a5,s3,0x3
  52:	fb040713          	addi	a4,s0,-80
  56:	97ba                	add	a5,a5,a4
  58:	e207bc23          	sd	zero,-456(a5)
  int i = 0;
  5c:	4481                	li	s1,0
          fprintf(2, "xargs: too many arguments\n");
        }
      }
      break;
    }
    if (ch == '\n') {
  5e:	4a29                	li	s4,10
          fprintf(2, "xargs: too many arguments\n");
        }
      }
      i = 0;
    } else {
      if (i < 200 - 1) {
  60:	0c600a93          	li	s5,198
          xargv[base] = buf;
  64:	00399b93          	slli	s7,s3,0x3
  68:	9bba                	add	s7,s7,a4
          xargv[base + 1] = 0;
  6a:	00391b13          	slli	s6,s2,0x3
  6e:	9b3a                	add	s6,s6,a4
  70:	aaa9                	j	1ca <main+0x1ca>
    fprintf(2, "Usage: xargs command [args...]\n");
  72:	00001597          	auipc	a1,0x1
  76:	94e58593          	addi	a1,a1,-1714 # 9c0 <malloc+0xec>
  7a:	4509                	li	a0,2
  7c:	00000097          	auipc	ra,0x0
  80:	76c080e7          	jalr	1900(ra) # 7e8 <fprintf>
    exit(1);
  84:	4505                	li	a0,1
  86:	00000097          	auipc	ra,0x0
  8a:	418080e7          	jalr	1048(ra) # 49e <exit>
      fprintf(2, "xargs: read error\n");
  8e:	00001597          	auipc	a1,0x1
  92:	95258593          	addi	a1,a1,-1710 # 9e0 <malloc+0x10c>
  96:	4509                	li	a0,2
  98:	00000097          	auipc	ra,0x0
  9c:	750080e7          	jalr	1872(ra) # 7e8 <fprintf>
      exit(1);
  a0:	4505                	li	a0,1
  a2:	00000097          	auipc	ra,0x0
  a6:	3fc080e7          	jalr	1020(ra) # 49e <exit>
      if (i > 0) {
  aa:	08905663          	blez	s1,136 <main+0x136>
        buf[i] = 0;
  ae:	fb040793          	addi	a5,s0,-80
  b2:	94be                	add	s1,s1,a5
  b4:	f2048c23          	sb	zero,-200(s1)
        if (base + 1 < MAXARG) {
  b8:	47f9                	li	a5,30
  ba:	0737c563          	blt	a5,s3,124 <main+0x124>
          xargv[base] = buf;
  be:	00399793          	slli	a5,s3,0x3
  c2:	fb040713          	addi	a4,s0,-80
  c6:	97ba                	add	a5,a5,a4
  c8:	ee840713          	addi	a4,s0,-280
  cc:	e2e7bc23          	sd	a4,-456(a5)
          xargv[base + 1] = 0;
  d0:	00391793          	slli	a5,s2,0x3
  d4:	fb040713          	addi	a4,s0,-80
  d8:	97ba                	add	a5,a5,a4
  da:	e207bc23          	sd	zero,-456(a5)
          if (fork() == 0) {
  de:	00000097          	auipc	ra,0x0
  e2:	3b8080e7          	jalr	952(ra) # 496 <fork>
  e6:	e90d                	bnez	a0,118 <main+0x118>
            exec(xargv[0], xargv);
  e8:	de840593          	addi	a1,s0,-536
  ec:	de843503          	ld	a0,-536(s0)
  f0:	00000097          	auipc	ra,0x0
  f4:	3e6080e7          	jalr	998(ra) # 4d6 <exec>
            fprintf(2, "xargs: exec %s failed\n", xargv[0]);
  f8:	de843603          	ld	a2,-536(s0)
  fc:	00001597          	auipc	a1,0x1
 100:	8fc58593          	addi	a1,a1,-1796 # 9f8 <malloc+0x124>
 104:	4509                	li	a0,2
 106:	00000097          	auipc	ra,0x0
 10a:	6e2080e7          	jalr	1762(ra) # 7e8 <fprintf>
            exit(1);
 10e:	4505                	li	a0,1
 110:	00000097          	auipc	ra,0x0
 114:	38e080e7          	jalr	910(ra) # 49e <exit>
          wait(0);
 118:	4501                	li	a0,0
 11a:	00000097          	auipc	ra,0x0
 11e:	38c080e7          	jalr	908(ra) # 4a6 <wait>
 122:	a811                	j	136 <main+0x136>
          fprintf(2, "xargs: too many arguments\n");
 124:	00001597          	auipc	a1,0x1
 128:	8ec58593          	addi	a1,a1,-1812 # a10 <malloc+0x13c>
 12c:	4509                	li	a0,2
 12e:	00000097          	auipc	ra,0x0
 132:	6ba080e7          	jalr	1722(ra) # 7e8 <fprintf>
        fprintf(2, "xargs: input line too long\n");
        exit(1);
      }
    }
  }
  exit(0);
 136:	4501                	li	a0,0
 138:	00000097          	auipc	ra,0x0
 13c:	366080e7          	jalr	870(ra) # 49e <exit>
      if (i > 0) {
 140:	0c905563          	blez	s1,20a <main+0x20a>
        buf[i] = 0;
 144:	fb040793          	addi	a5,s0,-80
 148:	94be                	add	s1,s1,a5
 14a:	f2048c23          	sb	zero,-200(s1)
        if (base + 1 < MAXARG) {
 14e:	47f9                	li	a5,30
 150:	0537cc63          	blt	a5,s3,1a8 <main+0x1a8>
          xargv[base] = buf;
 154:	ee840793          	addi	a5,s0,-280
 158:	e2fbbc23          	sd	a5,-456(s7)
          xargv[base + 1] = 0;
 15c:	e20b3c23          	sd	zero,-456(s6)
          if (fork() == 0) {
 160:	00000097          	auipc	ra,0x0
 164:	336080e7          	jalr	822(ra) # 496 <fork>
 168:	c901                	beqz	a0,178 <main+0x178>
          wait(0);
 16a:	4501                	li	a0,0
 16c:	00000097          	auipc	ra,0x0
 170:	33a080e7          	jalr	826(ra) # 4a6 <wait>
      i = 0;
 174:	4481                	li	s1,0
 176:	a891                	j	1ca <main+0x1ca>
            exec(xargv[0], xargv);
 178:	de840593          	addi	a1,s0,-536
 17c:	de843503          	ld	a0,-536(s0)
 180:	00000097          	auipc	ra,0x0
 184:	356080e7          	jalr	854(ra) # 4d6 <exec>
            fprintf(2, "xargs: exec %s failed\n", xargv[0]);
 188:	de843603          	ld	a2,-536(s0)
 18c:	00001597          	auipc	a1,0x1
 190:	86c58593          	addi	a1,a1,-1940 # 9f8 <malloc+0x124>
 194:	4509                	li	a0,2
 196:	00000097          	auipc	ra,0x0
 19a:	652080e7          	jalr	1618(ra) # 7e8 <fprintf>
            exit(1);
 19e:	4505                	li	a0,1
 1a0:	00000097          	auipc	ra,0x0
 1a4:	2fe080e7          	jalr	766(ra) # 49e <exit>
          fprintf(2, "xargs: too many arguments\n");
 1a8:	00001597          	auipc	a1,0x1
 1ac:	86858593          	addi	a1,a1,-1944 # a10 <malloc+0x13c>
 1b0:	4509                	li	a0,2
 1b2:	00000097          	auipc	ra,0x0
 1b6:	636080e7          	jalr	1590(ra) # 7e8 <fprintf>
      i = 0;
 1ba:	4481                	li	s1,0
 1bc:	a039                	j	1ca <main+0x1ca>
        buf[i++] = ch;
 1be:	fb040713          	addi	a4,s0,-80
 1c2:	9726                	add	a4,a4,s1
 1c4:	f2f70c23          	sb	a5,-200(a4)
 1c8:	2485                	addiw	s1,s1,1
    int n = read(0, &ch, 1);
 1ca:	4605                	li	a2,1
 1cc:	de740593          	addi	a1,s0,-537
 1d0:	4501                	li	a0,0
 1d2:	00000097          	auipc	ra,0x0
 1d6:	2e4080e7          	jalr	740(ra) # 4b6 <read>
    if (n < 0) {
 1da:	ea054ae3          	bltz	a0,8e <main+0x8e>
    if (n == 0) {
 1de:	ec0506e3          	beqz	a0,aa <main+0xaa>
    if (ch == '\n') {
 1e2:	de744783          	lbu	a5,-537(s0)
 1e6:	f5478de3          	beq	a5,s4,140 <main+0x140>
      if (i < 200 - 1) {
 1ea:	fc9adae3          	bge	s5,s1,1be <main+0x1be>
        fprintf(2, "xargs: input line too long\n");
 1ee:	00001597          	auipc	a1,0x1
 1f2:	84258593          	addi	a1,a1,-1982 # a30 <malloc+0x15c>
 1f6:	4509                	li	a0,2
 1f8:	00000097          	auipc	ra,0x0
 1fc:	5f0080e7          	jalr	1520(ra) # 7e8 <fprintf>
        exit(1);
 200:	4505                	li	a0,1
 202:	00000097          	auipc	ra,0x0
 206:	29c080e7          	jalr	668(ra) # 49e <exit>
      i = 0;
 20a:	4481                	li	s1,0
  while (1) {
 20c:	bf7d                	j	1ca <main+0x1ca>

000000000000020e <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
 20e:	1141                	addi	sp,sp,-16
 210:	e406                	sd	ra,8(sp)
 212:	e022                	sd	s0,0(sp)
 214:	0800                	addi	s0,sp,16
  extern int main();
  main();
 216:	00000097          	auipc	ra,0x0
 21a:	dea080e7          	jalr	-534(ra) # 0 <main>
  exit(0);
 21e:	4501                	li	a0,0
 220:	00000097          	auipc	ra,0x0
 224:	27e080e7          	jalr	638(ra) # 49e <exit>

0000000000000228 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 228:	1141                	addi	sp,sp,-16
 22a:	e422                	sd	s0,8(sp)
 22c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 22e:	87aa                	mv	a5,a0
 230:	0585                	addi	a1,a1,1
 232:	0785                	addi	a5,a5,1
 234:	fff5c703          	lbu	a4,-1(a1)
 238:	fee78fa3          	sb	a4,-1(a5)
 23c:	fb75                	bnez	a4,230 <strcpy+0x8>
    ;
  return os;
}
 23e:	6422                	ld	s0,8(sp)
 240:	0141                	addi	sp,sp,16
 242:	8082                	ret

0000000000000244 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 244:	1141                	addi	sp,sp,-16
 246:	e422                	sd	s0,8(sp)
 248:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 24a:	00054783          	lbu	a5,0(a0)
 24e:	cb91                	beqz	a5,262 <strcmp+0x1e>
 250:	0005c703          	lbu	a4,0(a1)
 254:	00f71763          	bne	a4,a5,262 <strcmp+0x1e>
    p++, q++;
 258:	0505                	addi	a0,a0,1
 25a:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 25c:	00054783          	lbu	a5,0(a0)
 260:	fbe5                	bnez	a5,250 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 262:	0005c503          	lbu	a0,0(a1)
}
 266:	40a7853b          	subw	a0,a5,a0
 26a:	6422                	ld	s0,8(sp)
 26c:	0141                	addi	sp,sp,16
 26e:	8082                	ret

0000000000000270 <strlen>:

uint
strlen(const char *s)
{
 270:	1141                	addi	sp,sp,-16
 272:	e422                	sd	s0,8(sp)
 274:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 276:	00054783          	lbu	a5,0(a0)
 27a:	cf91                	beqz	a5,296 <strlen+0x26>
 27c:	0505                	addi	a0,a0,1
 27e:	87aa                	mv	a5,a0
 280:	4685                	li	a3,1
 282:	9e89                	subw	a3,a3,a0
 284:	00f6853b          	addw	a0,a3,a5
 288:	0785                	addi	a5,a5,1
 28a:	fff7c703          	lbu	a4,-1(a5)
 28e:	fb7d                	bnez	a4,284 <strlen+0x14>
    ;
  return n;
}
 290:	6422                	ld	s0,8(sp)
 292:	0141                	addi	sp,sp,16
 294:	8082                	ret
  for(n = 0; s[n]; n++)
 296:	4501                	li	a0,0
 298:	bfe5                	j	290 <strlen+0x20>

000000000000029a <memset>:

void*
memset(void *dst, int c, uint n)
{
 29a:	1141                	addi	sp,sp,-16
 29c:	e422                	sd	s0,8(sp)
 29e:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 2a0:	ce09                	beqz	a2,2ba <memset+0x20>
 2a2:	87aa                	mv	a5,a0
 2a4:	fff6071b          	addiw	a4,a2,-1
 2a8:	1702                	slli	a4,a4,0x20
 2aa:	9301                	srli	a4,a4,0x20
 2ac:	0705                	addi	a4,a4,1
 2ae:	972a                	add	a4,a4,a0
    cdst[i] = c;
 2b0:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 2b4:	0785                	addi	a5,a5,1
 2b6:	fee79de3          	bne	a5,a4,2b0 <memset+0x16>
  }
  return dst;
}
 2ba:	6422                	ld	s0,8(sp)
 2bc:	0141                	addi	sp,sp,16
 2be:	8082                	ret

00000000000002c0 <strchr>:

char*
strchr(const char *s, char c)
{
 2c0:	1141                	addi	sp,sp,-16
 2c2:	e422                	sd	s0,8(sp)
 2c4:	0800                	addi	s0,sp,16
  for(; *s; s++)
 2c6:	00054783          	lbu	a5,0(a0)
 2ca:	cb99                	beqz	a5,2e0 <strchr+0x20>
    if(*s == c)
 2cc:	00f58763          	beq	a1,a5,2da <strchr+0x1a>
  for(; *s; s++)
 2d0:	0505                	addi	a0,a0,1
 2d2:	00054783          	lbu	a5,0(a0)
 2d6:	fbfd                	bnez	a5,2cc <strchr+0xc>
      return (char*)s;
  return 0;
 2d8:	4501                	li	a0,0
}
 2da:	6422                	ld	s0,8(sp)
 2dc:	0141                	addi	sp,sp,16
 2de:	8082                	ret
  return 0;
 2e0:	4501                	li	a0,0
 2e2:	bfe5                	j	2da <strchr+0x1a>

00000000000002e4 <gets>:

char*
gets(char *buf, int max)
{
 2e4:	711d                	addi	sp,sp,-96
 2e6:	ec86                	sd	ra,88(sp)
 2e8:	e8a2                	sd	s0,80(sp)
 2ea:	e4a6                	sd	s1,72(sp)
 2ec:	e0ca                	sd	s2,64(sp)
 2ee:	fc4e                	sd	s3,56(sp)
 2f0:	f852                	sd	s4,48(sp)
 2f2:	f456                	sd	s5,40(sp)
 2f4:	f05a                	sd	s6,32(sp)
 2f6:	ec5e                	sd	s7,24(sp)
 2f8:	1080                	addi	s0,sp,96
 2fa:	8baa                	mv	s7,a0
 2fc:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2fe:	892a                	mv	s2,a0
 300:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 302:	4aa9                	li	s5,10
 304:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 306:	89a6                	mv	s3,s1
 308:	2485                	addiw	s1,s1,1
 30a:	0344d863          	bge	s1,s4,33a <gets+0x56>
    cc = read(0, &c, 1);
 30e:	4605                	li	a2,1
 310:	faf40593          	addi	a1,s0,-81
 314:	4501                	li	a0,0
 316:	00000097          	auipc	ra,0x0
 31a:	1a0080e7          	jalr	416(ra) # 4b6 <read>
    if(cc < 1)
 31e:	00a05e63          	blez	a0,33a <gets+0x56>
    buf[i++] = c;
 322:	faf44783          	lbu	a5,-81(s0)
 326:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 32a:	01578763          	beq	a5,s5,338 <gets+0x54>
 32e:	0905                	addi	s2,s2,1
 330:	fd679be3          	bne	a5,s6,306 <gets+0x22>
  for(i=0; i+1 < max; ){
 334:	89a6                	mv	s3,s1
 336:	a011                	j	33a <gets+0x56>
 338:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 33a:	99de                	add	s3,s3,s7
 33c:	00098023          	sb	zero,0(s3)
  return buf;
}
 340:	855e                	mv	a0,s7
 342:	60e6                	ld	ra,88(sp)
 344:	6446                	ld	s0,80(sp)
 346:	64a6                	ld	s1,72(sp)
 348:	6906                	ld	s2,64(sp)
 34a:	79e2                	ld	s3,56(sp)
 34c:	7a42                	ld	s4,48(sp)
 34e:	7aa2                	ld	s5,40(sp)
 350:	7b02                	ld	s6,32(sp)
 352:	6be2                	ld	s7,24(sp)
 354:	6125                	addi	sp,sp,96
 356:	8082                	ret

0000000000000358 <stat>:

int
stat(const char *n, struct stat *st)
{
 358:	1101                	addi	sp,sp,-32
 35a:	ec06                	sd	ra,24(sp)
 35c:	e822                	sd	s0,16(sp)
 35e:	e426                	sd	s1,8(sp)
 360:	e04a                	sd	s2,0(sp)
 362:	1000                	addi	s0,sp,32
 364:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 366:	4581                	li	a1,0
 368:	00000097          	auipc	ra,0x0
 36c:	176080e7          	jalr	374(ra) # 4de <open>
  if(fd < 0)
 370:	02054563          	bltz	a0,39a <stat+0x42>
 374:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 376:	85ca                	mv	a1,s2
 378:	00000097          	auipc	ra,0x0
 37c:	17e080e7          	jalr	382(ra) # 4f6 <fstat>
 380:	892a                	mv	s2,a0
  close(fd);
 382:	8526                	mv	a0,s1
 384:	00000097          	auipc	ra,0x0
 388:	142080e7          	jalr	322(ra) # 4c6 <close>
  return r;
}
 38c:	854a                	mv	a0,s2
 38e:	60e2                	ld	ra,24(sp)
 390:	6442                	ld	s0,16(sp)
 392:	64a2                	ld	s1,8(sp)
 394:	6902                	ld	s2,0(sp)
 396:	6105                	addi	sp,sp,32
 398:	8082                	ret
    return -1;
 39a:	597d                	li	s2,-1
 39c:	bfc5                	j	38c <stat+0x34>

000000000000039e <atoi>:

int
atoi(const char *s)
{
 39e:	1141                	addi	sp,sp,-16
 3a0:	e422                	sd	s0,8(sp)
 3a2:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3a4:	00054603          	lbu	a2,0(a0)
 3a8:	fd06079b          	addiw	a5,a2,-48
 3ac:	0ff7f793          	andi	a5,a5,255
 3b0:	4725                	li	a4,9
 3b2:	02f76963          	bltu	a4,a5,3e4 <atoi+0x46>
 3b6:	86aa                	mv	a3,a0
  n = 0;
 3b8:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 3ba:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 3bc:	0685                	addi	a3,a3,1
 3be:	0025179b          	slliw	a5,a0,0x2
 3c2:	9fa9                	addw	a5,a5,a0
 3c4:	0017979b          	slliw	a5,a5,0x1
 3c8:	9fb1                	addw	a5,a5,a2
 3ca:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 3ce:	0006c603          	lbu	a2,0(a3)
 3d2:	fd06071b          	addiw	a4,a2,-48
 3d6:	0ff77713          	andi	a4,a4,255
 3da:	fee5f1e3          	bgeu	a1,a4,3bc <atoi+0x1e>
  return n;
}
 3de:	6422                	ld	s0,8(sp)
 3e0:	0141                	addi	sp,sp,16
 3e2:	8082                	ret
  n = 0;
 3e4:	4501                	li	a0,0
 3e6:	bfe5                	j	3de <atoi+0x40>

00000000000003e8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e8:	1141                	addi	sp,sp,-16
 3ea:	e422                	sd	s0,8(sp)
 3ec:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3ee:	02b57663          	bgeu	a0,a1,41a <memmove+0x32>
    while(n-- > 0)
 3f2:	02c05163          	blez	a2,414 <memmove+0x2c>
 3f6:	fff6079b          	addiw	a5,a2,-1
 3fa:	1782                	slli	a5,a5,0x20
 3fc:	9381                	srli	a5,a5,0x20
 3fe:	0785                	addi	a5,a5,1
 400:	97aa                	add	a5,a5,a0
  dst = vdst;
 402:	872a                	mv	a4,a0
      *dst++ = *src++;
 404:	0585                	addi	a1,a1,1
 406:	0705                	addi	a4,a4,1
 408:	fff5c683          	lbu	a3,-1(a1)
 40c:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 410:	fee79ae3          	bne	a5,a4,404 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 414:	6422                	ld	s0,8(sp)
 416:	0141                	addi	sp,sp,16
 418:	8082                	ret
    dst += n;
 41a:	00c50733          	add	a4,a0,a2
    src += n;
 41e:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 420:	fec05ae3          	blez	a2,414 <memmove+0x2c>
 424:	fff6079b          	addiw	a5,a2,-1
 428:	1782                	slli	a5,a5,0x20
 42a:	9381                	srli	a5,a5,0x20
 42c:	fff7c793          	not	a5,a5
 430:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 432:	15fd                	addi	a1,a1,-1
 434:	177d                	addi	a4,a4,-1
 436:	0005c683          	lbu	a3,0(a1)
 43a:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 43e:	fee79ae3          	bne	a5,a4,432 <memmove+0x4a>
 442:	bfc9                	j	414 <memmove+0x2c>

0000000000000444 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 444:	1141                	addi	sp,sp,-16
 446:	e422                	sd	s0,8(sp)
 448:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 44a:	ca05                	beqz	a2,47a <memcmp+0x36>
 44c:	fff6069b          	addiw	a3,a2,-1
 450:	1682                	slli	a3,a3,0x20
 452:	9281                	srli	a3,a3,0x20
 454:	0685                	addi	a3,a3,1
 456:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 458:	00054783          	lbu	a5,0(a0)
 45c:	0005c703          	lbu	a4,0(a1)
 460:	00e79863          	bne	a5,a4,470 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 464:	0505                	addi	a0,a0,1
    p2++;
 466:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 468:	fed518e3          	bne	a0,a3,458 <memcmp+0x14>
  }
  return 0;
 46c:	4501                	li	a0,0
 46e:	a019                	j	474 <memcmp+0x30>
      return *p1 - *p2;
 470:	40e7853b          	subw	a0,a5,a4
}
 474:	6422                	ld	s0,8(sp)
 476:	0141                	addi	sp,sp,16
 478:	8082                	ret
  return 0;
 47a:	4501                	li	a0,0
 47c:	bfe5                	j	474 <memcmp+0x30>

000000000000047e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 47e:	1141                	addi	sp,sp,-16
 480:	e406                	sd	ra,8(sp)
 482:	e022                	sd	s0,0(sp)
 484:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 486:	00000097          	auipc	ra,0x0
 48a:	f62080e7          	jalr	-158(ra) # 3e8 <memmove>
}
 48e:	60a2                	ld	ra,8(sp)
 490:	6402                	ld	s0,0(sp)
 492:	0141                	addi	sp,sp,16
 494:	8082                	ret

0000000000000496 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 496:	4885                	li	a7,1
 ecall
 498:	00000073          	ecall
 ret
 49c:	8082                	ret

000000000000049e <exit>:
.global exit
exit:
 li a7, SYS_exit
 49e:	4889                	li	a7,2
 ecall
 4a0:	00000073          	ecall
 ret
 4a4:	8082                	ret

00000000000004a6 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4a6:	488d                	li	a7,3
 ecall
 4a8:	00000073          	ecall
 ret
 4ac:	8082                	ret

00000000000004ae <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4ae:	4891                	li	a7,4
 ecall
 4b0:	00000073          	ecall
 ret
 4b4:	8082                	ret

00000000000004b6 <read>:
.global read
read:
 li a7, SYS_read
 4b6:	4895                	li	a7,5
 ecall
 4b8:	00000073          	ecall
 ret
 4bc:	8082                	ret

00000000000004be <write>:
.global write
write:
 li a7, SYS_write
 4be:	48c1                	li	a7,16
 ecall
 4c0:	00000073          	ecall
 ret
 4c4:	8082                	ret

00000000000004c6 <close>:
.global close
close:
 li a7, SYS_close
 4c6:	48d5                	li	a7,21
 ecall
 4c8:	00000073          	ecall
 ret
 4cc:	8082                	ret

00000000000004ce <kill>:
.global kill
kill:
 li a7, SYS_kill
 4ce:	4899                	li	a7,6
 ecall
 4d0:	00000073          	ecall
 ret
 4d4:	8082                	ret

00000000000004d6 <exec>:
.global exec
exec:
 li a7, SYS_exec
 4d6:	489d                	li	a7,7
 ecall
 4d8:	00000073          	ecall
 ret
 4dc:	8082                	ret

00000000000004de <open>:
.global open
open:
 li a7, SYS_open
 4de:	48bd                	li	a7,15
 ecall
 4e0:	00000073          	ecall
 ret
 4e4:	8082                	ret

00000000000004e6 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 4e6:	48c5                	li	a7,17
 ecall
 4e8:	00000073          	ecall
 ret
 4ec:	8082                	ret

00000000000004ee <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 4ee:	48c9                	li	a7,18
 ecall
 4f0:	00000073          	ecall
 ret
 4f4:	8082                	ret

00000000000004f6 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4f6:	48a1                	li	a7,8
 ecall
 4f8:	00000073          	ecall
 ret
 4fc:	8082                	ret

00000000000004fe <link>:
.global link
link:
 li a7, SYS_link
 4fe:	48cd                	li	a7,19
 ecall
 500:	00000073          	ecall
 ret
 504:	8082                	ret

0000000000000506 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 506:	48d1                	li	a7,20
 ecall
 508:	00000073          	ecall
 ret
 50c:	8082                	ret

000000000000050e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 50e:	48a5                	li	a7,9
 ecall
 510:	00000073          	ecall
 ret
 514:	8082                	ret

0000000000000516 <dup>:
.global dup
dup:
 li a7, SYS_dup
 516:	48a9                	li	a7,10
 ecall
 518:	00000073          	ecall
 ret
 51c:	8082                	ret

000000000000051e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 51e:	48ad                	li	a7,11
 ecall
 520:	00000073          	ecall
 ret
 524:	8082                	ret

0000000000000526 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 526:	48b1                	li	a7,12
 ecall
 528:	00000073          	ecall
 ret
 52c:	8082                	ret

000000000000052e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 52e:	48b5                	li	a7,13
 ecall
 530:	00000073          	ecall
 ret
 534:	8082                	ret

0000000000000536 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 536:	48b9                	li	a7,14
 ecall
 538:	00000073          	ecall
 ret
 53c:	8082                	ret

000000000000053e <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 53e:	1101                	addi	sp,sp,-32
 540:	ec06                	sd	ra,24(sp)
 542:	e822                	sd	s0,16(sp)
 544:	1000                	addi	s0,sp,32
 546:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 54a:	4605                	li	a2,1
 54c:	fef40593          	addi	a1,s0,-17
 550:	00000097          	auipc	ra,0x0
 554:	f6e080e7          	jalr	-146(ra) # 4be <write>
}
 558:	60e2                	ld	ra,24(sp)
 55a:	6442                	ld	s0,16(sp)
 55c:	6105                	addi	sp,sp,32
 55e:	8082                	ret

0000000000000560 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 560:	7139                	addi	sp,sp,-64
 562:	fc06                	sd	ra,56(sp)
 564:	f822                	sd	s0,48(sp)
 566:	f426                	sd	s1,40(sp)
 568:	f04a                	sd	s2,32(sp)
 56a:	ec4e                	sd	s3,24(sp)
 56c:	0080                	addi	s0,sp,64
 56e:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 570:	c299                	beqz	a3,576 <printint+0x16>
 572:	0805c863          	bltz	a1,602 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 576:	2581                	sext.w	a1,a1
  neg = 0;
 578:	4881                	li	a7,0
 57a:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 57e:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 580:	2601                	sext.w	a2,a2
 582:	00000517          	auipc	a0,0x0
 586:	4d650513          	addi	a0,a0,1238 # a58 <digits>
 58a:	883a                	mv	a6,a4
 58c:	2705                	addiw	a4,a4,1
 58e:	02c5f7bb          	remuw	a5,a1,a2
 592:	1782                	slli	a5,a5,0x20
 594:	9381                	srli	a5,a5,0x20
 596:	97aa                	add	a5,a5,a0
 598:	0007c783          	lbu	a5,0(a5)
 59c:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5a0:	0005879b          	sext.w	a5,a1
 5a4:	02c5d5bb          	divuw	a1,a1,a2
 5a8:	0685                	addi	a3,a3,1
 5aa:	fec7f0e3          	bgeu	a5,a2,58a <printint+0x2a>
  if(neg)
 5ae:	00088b63          	beqz	a7,5c4 <printint+0x64>
    buf[i++] = '-';
 5b2:	fd040793          	addi	a5,s0,-48
 5b6:	973e                	add	a4,a4,a5
 5b8:	02d00793          	li	a5,45
 5bc:	fef70823          	sb	a5,-16(a4)
 5c0:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5c4:	02e05863          	blez	a4,5f4 <printint+0x94>
 5c8:	fc040793          	addi	a5,s0,-64
 5cc:	00e78933          	add	s2,a5,a4
 5d0:	fff78993          	addi	s3,a5,-1
 5d4:	99ba                	add	s3,s3,a4
 5d6:	377d                	addiw	a4,a4,-1
 5d8:	1702                	slli	a4,a4,0x20
 5da:	9301                	srli	a4,a4,0x20
 5dc:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 5e0:	fff94583          	lbu	a1,-1(s2)
 5e4:	8526                	mv	a0,s1
 5e6:	00000097          	auipc	ra,0x0
 5ea:	f58080e7          	jalr	-168(ra) # 53e <putc>
  while(--i >= 0)
 5ee:	197d                	addi	s2,s2,-1
 5f0:	ff3918e3          	bne	s2,s3,5e0 <printint+0x80>
}
 5f4:	70e2                	ld	ra,56(sp)
 5f6:	7442                	ld	s0,48(sp)
 5f8:	74a2                	ld	s1,40(sp)
 5fa:	7902                	ld	s2,32(sp)
 5fc:	69e2                	ld	s3,24(sp)
 5fe:	6121                	addi	sp,sp,64
 600:	8082                	ret
    x = -xx;
 602:	40b005bb          	negw	a1,a1
    neg = 1;
 606:	4885                	li	a7,1
    x = -xx;
 608:	bf8d                	j	57a <printint+0x1a>

000000000000060a <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 60a:	7119                	addi	sp,sp,-128
 60c:	fc86                	sd	ra,120(sp)
 60e:	f8a2                	sd	s0,112(sp)
 610:	f4a6                	sd	s1,104(sp)
 612:	f0ca                	sd	s2,96(sp)
 614:	ecce                	sd	s3,88(sp)
 616:	e8d2                	sd	s4,80(sp)
 618:	e4d6                	sd	s5,72(sp)
 61a:	e0da                	sd	s6,64(sp)
 61c:	fc5e                	sd	s7,56(sp)
 61e:	f862                	sd	s8,48(sp)
 620:	f466                	sd	s9,40(sp)
 622:	f06a                	sd	s10,32(sp)
 624:	ec6e                	sd	s11,24(sp)
 626:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 628:	0005c903          	lbu	s2,0(a1)
 62c:	18090f63          	beqz	s2,7ca <vprintf+0x1c0>
 630:	8aaa                	mv	s5,a0
 632:	8b32                	mv	s6,a2
 634:	00158493          	addi	s1,a1,1
  state = 0;
 638:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 63a:	02500a13          	li	s4,37
      if(c == 'd'){
 63e:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 642:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 646:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 64a:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 64e:	00000b97          	auipc	s7,0x0
 652:	40ab8b93          	addi	s7,s7,1034 # a58 <digits>
 656:	a839                	j	674 <vprintf+0x6a>
        putc(fd, c);
 658:	85ca                	mv	a1,s2
 65a:	8556                	mv	a0,s5
 65c:	00000097          	auipc	ra,0x0
 660:	ee2080e7          	jalr	-286(ra) # 53e <putc>
 664:	a019                	j	66a <vprintf+0x60>
    } else if(state == '%'){
 666:	01498f63          	beq	s3,s4,684 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 66a:	0485                	addi	s1,s1,1
 66c:	fff4c903          	lbu	s2,-1(s1)
 670:	14090d63          	beqz	s2,7ca <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 674:	0009079b          	sext.w	a5,s2
    if(state == 0){
 678:	fe0997e3          	bnez	s3,666 <vprintf+0x5c>
      if(c == '%'){
 67c:	fd479ee3          	bne	a5,s4,658 <vprintf+0x4e>
        state = '%';
 680:	89be                	mv	s3,a5
 682:	b7e5                	j	66a <vprintf+0x60>
      if(c == 'd'){
 684:	05878063          	beq	a5,s8,6c4 <vprintf+0xba>
      } else if(c == 'l') {
 688:	05978c63          	beq	a5,s9,6e0 <vprintf+0xd6>
      } else if(c == 'x') {
 68c:	07a78863          	beq	a5,s10,6fc <vprintf+0xf2>
      } else if(c == 'p') {
 690:	09b78463          	beq	a5,s11,718 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 694:	07300713          	li	a4,115
 698:	0ce78663          	beq	a5,a4,764 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 69c:	06300713          	li	a4,99
 6a0:	0ee78e63          	beq	a5,a4,79c <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 6a4:	11478863          	beq	a5,s4,7b4 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6a8:	85d2                	mv	a1,s4
 6aa:	8556                	mv	a0,s5
 6ac:	00000097          	auipc	ra,0x0
 6b0:	e92080e7          	jalr	-366(ra) # 53e <putc>
        putc(fd, c);
 6b4:	85ca                	mv	a1,s2
 6b6:	8556                	mv	a0,s5
 6b8:	00000097          	auipc	ra,0x0
 6bc:	e86080e7          	jalr	-378(ra) # 53e <putc>
      }
      state = 0;
 6c0:	4981                	li	s3,0
 6c2:	b765                	j	66a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 6c4:	008b0913          	addi	s2,s6,8
 6c8:	4685                	li	a3,1
 6ca:	4629                	li	a2,10
 6cc:	000b2583          	lw	a1,0(s6)
 6d0:	8556                	mv	a0,s5
 6d2:	00000097          	auipc	ra,0x0
 6d6:	e8e080e7          	jalr	-370(ra) # 560 <printint>
 6da:	8b4a                	mv	s6,s2
      state = 0;
 6dc:	4981                	li	s3,0
 6de:	b771                	j	66a <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6e0:	008b0913          	addi	s2,s6,8
 6e4:	4681                	li	a3,0
 6e6:	4629                	li	a2,10
 6e8:	000b2583          	lw	a1,0(s6)
 6ec:	8556                	mv	a0,s5
 6ee:	00000097          	auipc	ra,0x0
 6f2:	e72080e7          	jalr	-398(ra) # 560 <printint>
 6f6:	8b4a                	mv	s6,s2
      state = 0;
 6f8:	4981                	li	s3,0
 6fa:	bf85                	j	66a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 6fc:	008b0913          	addi	s2,s6,8
 700:	4681                	li	a3,0
 702:	4641                	li	a2,16
 704:	000b2583          	lw	a1,0(s6)
 708:	8556                	mv	a0,s5
 70a:	00000097          	auipc	ra,0x0
 70e:	e56080e7          	jalr	-426(ra) # 560 <printint>
 712:	8b4a                	mv	s6,s2
      state = 0;
 714:	4981                	li	s3,0
 716:	bf91                	j	66a <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 718:	008b0793          	addi	a5,s6,8
 71c:	f8f43423          	sd	a5,-120(s0)
 720:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 724:	03000593          	li	a1,48
 728:	8556                	mv	a0,s5
 72a:	00000097          	auipc	ra,0x0
 72e:	e14080e7          	jalr	-492(ra) # 53e <putc>
  putc(fd, 'x');
 732:	85ea                	mv	a1,s10
 734:	8556                	mv	a0,s5
 736:	00000097          	auipc	ra,0x0
 73a:	e08080e7          	jalr	-504(ra) # 53e <putc>
 73e:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 740:	03c9d793          	srli	a5,s3,0x3c
 744:	97de                	add	a5,a5,s7
 746:	0007c583          	lbu	a1,0(a5)
 74a:	8556                	mv	a0,s5
 74c:	00000097          	auipc	ra,0x0
 750:	df2080e7          	jalr	-526(ra) # 53e <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 754:	0992                	slli	s3,s3,0x4
 756:	397d                	addiw	s2,s2,-1
 758:	fe0914e3          	bnez	s2,740 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 75c:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 760:	4981                	li	s3,0
 762:	b721                	j	66a <vprintf+0x60>
        s = va_arg(ap, char*);
 764:	008b0993          	addi	s3,s6,8
 768:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 76c:	02090163          	beqz	s2,78e <vprintf+0x184>
        while(*s != 0){
 770:	00094583          	lbu	a1,0(s2)
 774:	c9a1                	beqz	a1,7c4 <vprintf+0x1ba>
          putc(fd, *s);
 776:	8556                	mv	a0,s5
 778:	00000097          	auipc	ra,0x0
 77c:	dc6080e7          	jalr	-570(ra) # 53e <putc>
          s++;
 780:	0905                	addi	s2,s2,1
        while(*s != 0){
 782:	00094583          	lbu	a1,0(s2)
 786:	f9e5                	bnez	a1,776 <vprintf+0x16c>
        s = va_arg(ap, char*);
 788:	8b4e                	mv	s6,s3
      state = 0;
 78a:	4981                	li	s3,0
 78c:	bdf9                	j	66a <vprintf+0x60>
          s = "(null)";
 78e:	00000917          	auipc	s2,0x0
 792:	2c290913          	addi	s2,s2,706 # a50 <malloc+0x17c>
        while(*s != 0){
 796:	02800593          	li	a1,40
 79a:	bff1                	j	776 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 79c:	008b0913          	addi	s2,s6,8
 7a0:	000b4583          	lbu	a1,0(s6)
 7a4:	8556                	mv	a0,s5
 7a6:	00000097          	auipc	ra,0x0
 7aa:	d98080e7          	jalr	-616(ra) # 53e <putc>
 7ae:	8b4a                	mv	s6,s2
      state = 0;
 7b0:	4981                	li	s3,0
 7b2:	bd65                	j	66a <vprintf+0x60>
        putc(fd, c);
 7b4:	85d2                	mv	a1,s4
 7b6:	8556                	mv	a0,s5
 7b8:	00000097          	auipc	ra,0x0
 7bc:	d86080e7          	jalr	-634(ra) # 53e <putc>
      state = 0;
 7c0:	4981                	li	s3,0
 7c2:	b565                	j	66a <vprintf+0x60>
        s = va_arg(ap, char*);
 7c4:	8b4e                	mv	s6,s3
      state = 0;
 7c6:	4981                	li	s3,0
 7c8:	b54d                	j	66a <vprintf+0x60>
    }
  }
}
 7ca:	70e6                	ld	ra,120(sp)
 7cc:	7446                	ld	s0,112(sp)
 7ce:	74a6                	ld	s1,104(sp)
 7d0:	7906                	ld	s2,96(sp)
 7d2:	69e6                	ld	s3,88(sp)
 7d4:	6a46                	ld	s4,80(sp)
 7d6:	6aa6                	ld	s5,72(sp)
 7d8:	6b06                	ld	s6,64(sp)
 7da:	7be2                	ld	s7,56(sp)
 7dc:	7c42                	ld	s8,48(sp)
 7de:	7ca2                	ld	s9,40(sp)
 7e0:	7d02                	ld	s10,32(sp)
 7e2:	6de2                	ld	s11,24(sp)
 7e4:	6109                	addi	sp,sp,128
 7e6:	8082                	ret

00000000000007e8 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 7e8:	715d                	addi	sp,sp,-80
 7ea:	ec06                	sd	ra,24(sp)
 7ec:	e822                	sd	s0,16(sp)
 7ee:	1000                	addi	s0,sp,32
 7f0:	e010                	sd	a2,0(s0)
 7f2:	e414                	sd	a3,8(s0)
 7f4:	e818                	sd	a4,16(s0)
 7f6:	ec1c                	sd	a5,24(s0)
 7f8:	03043023          	sd	a6,32(s0)
 7fc:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 800:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 804:	8622                	mv	a2,s0
 806:	00000097          	auipc	ra,0x0
 80a:	e04080e7          	jalr	-508(ra) # 60a <vprintf>
}
 80e:	60e2                	ld	ra,24(sp)
 810:	6442                	ld	s0,16(sp)
 812:	6161                	addi	sp,sp,80
 814:	8082                	ret

0000000000000816 <printf>:

void
printf(const char *fmt, ...)
{
 816:	711d                	addi	sp,sp,-96
 818:	ec06                	sd	ra,24(sp)
 81a:	e822                	sd	s0,16(sp)
 81c:	1000                	addi	s0,sp,32
 81e:	e40c                	sd	a1,8(s0)
 820:	e810                	sd	a2,16(s0)
 822:	ec14                	sd	a3,24(s0)
 824:	f018                	sd	a4,32(s0)
 826:	f41c                	sd	a5,40(s0)
 828:	03043823          	sd	a6,48(s0)
 82c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 830:	00840613          	addi	a2,s0,8
 834:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 838:	85aa                	mv	a1,a0
 83a:	4505                	li	a0,1
 83c:	00000097          	auipc	ra,0x0
 840:	dce080e7          	jalr	-562(ra) # 60a <vprintf>
}
 844:	60e2                	ld	ra,24(sp)
 846:	6442                	ld	s0,16(sp)
 848:	6125                	addi	sp,sp,96
 84a:	8082                	ret

000000000000084c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 84c:	1141                	addi	sp,sp,-16
 84e:	e422                	sd	s0,8(sp)
 850:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 852:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 856:	00000797          	auipc	a5,0x0
 85a:	7aa7b783          	ld	a5,1962(a5) # 1000 <freep>
 85e:	a805                	j	88e <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 860:	4618                	lw	a4,8(a2)
 862:	9db9                	addw	a1,a1,a4
 864:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 868:	6398                	ld	a4,0(a5)
 86a:	6318                	ld	a4,0(a4)
 86c:	fee53823          	sd	a4,-16(a0)
 870:	a091                	j	8b4 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 872:	ff852703          	lw	a4,-8(a0)
 876:	9e39                	addw	a2,a2,a4
 878:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 87a:	ff053703          	ld	a4,-16(a0)
 87e:	e398                	sd	a4,0(a5)
 880:	a099                	j	8c6 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 882:	6398                	ld	a4,0(a5)
 884:	00e7e463          	bltu	a5,a4,88c <free+0x40>
 888:	00e6ea63          	bltu	a3,a4,89c <free+0x50>
{
 88c:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 88e:	fed7fae3          	bgeu	a5,a3,882 <free+0x36>
 892:	6398                	ld	a4,0(a5)
 894:	00e6e463          	bltu	a3,a4,89c <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 898:	fee7eae3          	bltu	a5,a4,88c <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 89c:	ff852583          	lw	a1,-8(a0)
 8a0:	6390                	ld	a2,0(a5)
 8a2:	02059713          	slli	a4,a1,0x20
 8a6:	9301                	srli	a4,a4,0x20
 8a8:	0712                	slli	a4,a4,0x4
 8aa:	9736                	add	a4,a4,a3
 8ac:	fae60ae3          	beq	a2,a4,860 <free+0x14>
    bp->s.ptr = p->s.ptr;
 8b0:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8b4:	4790                	lw	a2,8(a5)
 8b6:	02061713          	slli	a4,a2,0x20
 8ba:	9301                	srli	a4,a4,0x20
 8bc:	0712                	slli	a4,a4,0x4
 8be:	973e                	add	a4,a4,a5
 8c0:	fae689e3          	beq	a3,a4,872 <free+0x26>
  } else
    p->s.ptr = bp;
 8c4:	e394                	sd	a3,0(a5)
  freep = p;
 8c6:	00000717          	auipc	a4,0x0
 8ca:	72f73d23          	sd	a5,1850(a4) # 1000 <freep>
}
 8ce:	6422                	ld	s0,8(sp)
 8d0:	0141                	addi	sp,sp,16
 8d2:	8082                	ret

00000000000008d4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8d4:	7139                	addi	sp,sp,-64
 8d6:	fc06                	sd	ra,56(sp)
 8d8:	f822                	sd	s0,48(sp)
 8da:	f426                	sd	s1,40(sp)
 8dc:	f04a                	sd	s2,32(sp)
 8de:	ec4e                	sd	s3,24(sp)
 8e0:	e852                	sd	s4,16(sp)
 8e2:	e456                	sd	s5,8(sp)
 8e4:	e05a                	sd	s6,0(sp)
 8e6:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e8:	02051493          	slli	s1,a0,0x20
 8ec:	9081                	srli	s1,s1,0x20
 8ee:	04bd                	addi	s1,s1,15
 8f0:	8091                	srli	s1,s1,0x4
 8f2:	0014899b          	addiw	s3,s1,1
 8f6:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 8f8:	00000517          	auipc	a0,0x0
 8fc:	70853503          	ld	a0,1800(a0) # 1000 <freep>
 900:	c515                	beqz	a0,92c <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 902:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 904:	4798                	lw	a4,8(a5)
 906:	02977f63          	bgeu	a4,s1,944 <malloc+0x70>
 90a:	8a4e                	mv	s4,s3
 90c:	0009871b          	sext.w	a4,s3
 910:	6685                	lui	a3,0x1
 912:	00d77363          	bgeu	a4,a3,918 <malloc+0x44>
 916:	6a05                	lui	s4,0x1
 918:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 91c:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 920:	00000917          	auipc	s2,0x0
 924:	6e090913          	addi	s2,s2,1760 # 1000 <freep>
  if(p == (char*)-1)
 928:	5afd                	li	s5,-1
 92a:	a88d                	j	99c <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 92c:	00000797          	auipc	a5,0x0
 930:	6e478793          	addi	a5,a5,1764 # 1010 <base>
 934:	00000717          	auipc	a4,0x0
 938:	6cf73623          	sd	a5,1740(a4) # 1000 <freep>
 93c:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 93e:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 942:	b7e1                	j	90a <malloc+0x36>
      if(p->s.size == nunits)
 944:	02e48b63          	beq	s1,a4,97a <malloc+0xa6>
        p->s.size -= nunits;
 948:	4137073b          	subw	a4,a4,s3
 94c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 94e:	1702                	slli	a4,a4,0x20
 950:	9301                	srli	a4,a4,0x20
 952:	0712                	slli	a4,a4,0x4
 954:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 956:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 95a:	00000717          	auipc	a4,0x0
 95e:	6aa73323          	sd	a0,1702(a4) # 1000 <freep>
      return (void*)(p + 1);
 962:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 966:	70e2                	ld	ra,56(sp)
 968:	7442                	ld	s0,48(sp)
 96a:	74a2                	ld	s1,40(sp)
 96c:	7902                	ld	s2,32(sp)
 96e:	69e2                	ld	s3,24(sp)
 970:	6a42                	ld	s4,16(sp)
 972:	6aa2                	ld	s5,8(sp)
 974:	6b02                	ld	s6,0(sp)
 976:	6121                	addi	sp,sp,64
 978:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 97a:	6398                	ld	a4,0(a5)
 97c:	e118                	sd	a4,0(a0)
 97e:	bff1                	j	95a <malloc+0x86>
  hp->s.size = nu;
 980:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 984:	0541                	addi	a0,a0,16
 986:	00000097          	auipc	ra,0x0
 98a:	ec6080e7          	jalr	-314(ra) # 84c <free>
  return freep;
 98e:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 992:	d971                	beqz	a0,966 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 994:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 996:	4798                	lw	a4,8(a5)
 998:	fa9776e3          	bgeu	a4,s1,944 <malloc+0x70>
    if(p == freep)
 99c:	00093703          	ld	a4,0(s2)
 9a0:	853e                	mv	a0,a5
 9a2:	fef719e3          	bne	a4,a5,994 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 9a6:	8552                	mv	a0,s4
 9a8:	00000097          	auipc	ra,0x0
 9ac:	b7e080e7          	jalr	-1154(ra) # 526 <sbrk>
  if(p == (char*)-1)
 9b0:	fd5518e3          	bne	a0,s5,980 <malloc+0xac>
        return 0;
 9b4:	4501                	li	a0,0
 9b6:	bf45                	j	966 <malloc+0x92>
