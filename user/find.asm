
user/_find:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <fmtname>:
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fs.h"

char*
fmtname(char *path) {
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
   e:	84aa                	mv	s1,a0
  static char buf[DIRSIZ+1];
  char *p;
  for(p=path+strlen(path); p >= path && *p != '/'; p--);
  10:	00000097          	auipc	ra,0x0
  14:	334080e7          	jalr	820(ra) # 344 <strlen>
  18:	02051793          	slli	a5,a0,0x20
  1c:	9381                	srli	a5,a5,0x20
  1e:	97a6                	add	a5,a5,s1
  20:	02f00693          	li	a3,47
  24:	0097e963          	bltu	a5,s1,36 <fmtname+0x36>
  28:	0007c703          	lbu	a4,0(a5)
  2c:	00d70563          	beq	a4,a3,36 <fmtname+0x36>
  30:	17fd                	addi	a5,a5,-1
  32:	fe97fbe3          	bgeu	a5,s1,28 <fmtname+0x28>
  p++;
  36:	00178493          	addi	s1,a5,1
  if(strlen(p) >= DIRSIZ)
  3a:	8526                	mv	a0,s1
  3c:	00000097          	auipc	ra,0x0
  40:	308080e7          	jalr	776(ra) # 344 <strlen>
  44:	2501                	sext.w	a0,a0
  46:	47b5                	li	a5,13
  48:	00a7fa63          	bgeu	a5,a0,5c <fmtname+0x5c>
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), 0, DIRSIZ-strlen(p));
  return buf;
}
  4c:	8526                	mv	a0,s1
  4e:	70a2                	ld	ra,40(sp)
  50:	7402                	ld	s0,32(sp)
  52:	64e2                	ld	s1,24(sp)
  54:	6942                	ld	s2,16(sp)
  56:	69a2                	ld	s3,8(sp)
  58:	6145                	addi	sp,sp,48
  5a:	8082                	ret
  memmove(buf, p, strlen(p));
  5c:	8526                	mv	a0,s1
  5e:	00000097          	auipc	ra,0x0
  62:	2e6080e7          	jalr	742(ra) # 344 <strlen>
  66:	00001997          	auipc	s3,0x1
  6a:	faa98993          	addi	s3,s3,-86 # 1010 <buf.1106>
  6e:	0005061b          	sext.w	a2,a0
  72:	85a6                	mv	a1,s1
  74:	854e                	mv	a0,s3
  76:	00000097          	auipc	ra,0x0
  7a:	446080e7          	jalr	1094(ra) # 4bc <memmove>
  memset(buf+strlen(p), 0, DIRSIZ-strlen(p));
  7e:	8526                	mv	a0,s1
  80:	00000097          	auipc	ra,0x0
  84:	2c4080e7          	jalr	708(ra) # 344 <strlen>
  88:	0005091b          	sext.w	s2,a0
  8c:	8526                	mv	a0,s1
  8e:	00000097          	auipc	ra,0x0
  92:	2b6080e7          	jalr	694(ra) # 344 <strlen>
  96:	1902                	slli	s2,s2,0x20
  98:	02095913          	srli	s2,s2,0x20
  9c:	4639                	li	a2,14
  9e:	9e09                	subw	a2,a2,a0
  a0:	4581                	li	a1,0
  a2:	01298533          	add	a0,s3,s2
  a6:	00000097          	auipc	ra,0x0
  aa:	2c8080e7          	jalr	712(ra) # 36e <memset>
  return buf;
  ae:	84ce                	mv	s1,s3
  b0:	bf71                	j	4c <fmtname+0x4c>

00000000000000b2 <find>:

void
find(char *path, char *target) {
  b2:	d8010113          	addi	sp,sp,-640
  b6:	26113c23          	sd	ra,632(sp)
  ba:	26813823          	sd	s0,624(sp)
  be:	26913423          	sd	s1,616(sp)
  c2:	27213023          	sd	s2,608(sp)
  c6:	25313c23          	sd	s3,600(sp)
  ca:	25413823          	sd	s4,592(sp)
  ce:	25513423          	sd	s5,584(sp)
  d2:	25613023          	sd	s6,576(sp)
  d6:	23713c23          	sd	s7,568(sp)
  da:	0500                	addi	s0,sp,640
  dc:	892a                	mv	s2,a0
  de:	89ae                	mv	s3,a1
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  e0:	4581                	li	a1,0
  e2:	00000097          	auipc	ra,0x0
  e6:	4d0080e7          	jalr	1232(ra) # 5b2 <open>
  ea:	06054a63          	bltz	a0,15e <find+0xac>
  ee:	84aa                	mv	s1,a0
    fprintf(2, "find: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  f0:	d8840593          	addi	a1,s0,-632
  f4:	00000097          	auipc	ra,0x0
  f8:	4d6080e7          	jalr	1238(ra) # 5ca <fstat>
  fc:	06054c63          	bltz	a0,174 <find+0xc2>
    fprintf(2, "find: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
 100:	d9041783          	lh	a5,-624(s0)
 104:	0007869b          	sext.w	a3,a5
 108:	4705                	li	a4,1
 10a:	08e68f63          	beq	a3,a4,1a8 <find+0xf6>
 10e:	4709                	li	a4,2
 110:	00e69d63          	bne	a3,a4,12a <find+0x78>
  case T_FILE:
    if(strcmp(fmtname(path), target) == 0)
 114:	854a                	mv	a0,s2
 116:	00000097          	auipc	ra,0x0
 11a:	eea080e7          	jalr	-278(ra) # 0 <fmtname>
 11e:	85ce                	mv	a1,s3
 120:	00000097          	auipc	ra,0x0
 124:	1f8080e7          	jalr	504(ra) # 318 <strcmp>
 128:	c535                	beqz	a0,194 <find+0xe2>
      }
      find(buf, target);
    }
    break;
  }
  close(fd);
 12a:	8526                	mv	a0,s1
 12c:	00000097          	auipc	ra,0x0
 130:	46e080e7          	jalr	1134(ra) # 59a <close>
}
 134:	27813083          	ld	ra,632(sp)
 138:	27013403          	ld	s0,624(sp)
 13c:	26813483          	ld	s1,616(sp)
 140:	26013903          	ld	s2,608(sp)
 144:	25813983          	ld	s3,600(sp)
 148:	25013a03          	ld	s4,592(sp)
 14c:	24813a83          	ld	s5,584(sp)
 150:	24013b03          	ld	s6,576(sp)
 154:	23813b83          	ld	s7,568(sp)
 158:	28010113          	addi	sp,sp,640
 15c:	8082                	ret
    fprintf(2, "find: cannot open %s\n", path);
 15e:	864a                	mv	a2,s2
 160:	00001597          	auipc	a1,0x1
 164:	93058593          	addi	a1,a1,-1744 # a90 <malloc+0xe8>
 168:	4509                	li	a0,2
 16a:	00000097          	auipc	ra,0x0
 16e:	752080e7          	jalr	1874(ra) # 8bc <fprintf>
    return;
 172:	b7c9                	j	134 <find+0x82>
    fprintf(2, "find: cannot stat %s\n", path);
 174:	864a                	mv	a2,s2
 176:	00001597          	auipc	a1,0x1
 17a:	93258593          	addi	a1,a1,-1742 # aa8 <malloc+0x100>
 17e:	4509                	li	a0,2
 180:	00000097          	auipc	ra,0x0
 184:	73c080e7          	jalr	1852(ra) # 8bc <fprintf>
    close(fd);
 188:	8526                	mv	a0,s1
 18a:	00000097          	auipc	ra,0x0
 18e:	410080e7          	jalr	1040(ra) # 59a <close>
    return;
 192:	b74d                	j	134 <find+0x82>
      printf("%s\n", path);
 194:	85ca                	mv	a1,s2
 196:	00001517          	auipc	a0,0x1
 19a:	92a50513          	addi	a0,a0,-1750 # ac0 <malloc+0x118>
 19e:	00000097          	auipc	ra,0x0
 1a2:	74c080e7          	jalr	1868(ra) # 8ea <printf>
 1a6:	b751                	j	12a <find+0x78>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1a8:	854a                	mv	a0,s2
 1aa:	00000097          	auipc	ra,0x0
 1ae:	19a080e7          	jalr	410(ra) # 344 <strlen>
 1b2:	2541                	addiw	a0,a0,16
 1b4:	20000793          	li	a5,512
 1b8:	00a7fc63          	bgeu	a5,a0,1d0 <find+0x11e>
      fprintf(2, "find: path too long\n");
 1bc:	00001597          	auipc	a1,0x1
 1c0:	90c58593          	addi	a1,a1,-1780 # ac8 <malloc+0x120>
 1c4:	4509                	li	a0,2
 1c6:	00000097          	auipc	ra,0x0
 1ca:	6f6080e7          	jalr	1782(ra) # 8bc <fprintf>
      break;
 1ce:	bfb1                	j	12a <find+0x78>
    strcpy(buf, path);
 1d0:	85ca                	mv	a1,s2
 1d2:	db040513          	addi	a0,s0,-592
 1d6:	00000097          	auipc	ra,0x0
 1da:	126080e7          	jalr	294(ra) # 2fc <strcpy>
    p = buf+strlen(buf);
 1de:	db040513          	addi	a0,s0,-592
 1e2:	00000097          	auipc	ra,0x0
 1e6:	162080e7          	jalr	354(ra) # 344 <strlen>
 1ea:	02051913          	slli	s2,a0,0x20
 1ee:	02095913          	srli	s2,s2,0x20
 1f2:	db040793          	addi	a5,s0,-592
 1f6:	993e                	add	s2,s2,a5
    *p++ = '/';
 1f8:	00190b13          	addi	s6,s2,1
 1fc:	02f00793          	li	a5,47
 200:	00f90023          	sb	a5,0(s2)
      if(strcmp(de.name, ".") == 0 || strcmp(de.name, "..") == 0)
 204:	00001a97          	auipc	s5,0x1
 208:	8dca8a93          	addi	s5,s5,-1828 # ae0 <malloc+0x138>
 20c:	00001b97          	auipc	s7,0x1
 210:	8dcb8b93          	addi	s7,s7,-1828 # ae8 <malloc+0x140>
 214:	da240a13          	addi	s4,s0,-606
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 218:	4641                	li	a2,16
 21a:	da040593          	addi	a1,s0,-608
 21e:	8526                	mv	a0,s1
 220:	00000097          	auipc	ra,0x0
 224:	36a080e7          	jalr	874(ra) # 58a <read>
 228:	47c1                	li	a5,16
 22a:	f0f510e3          	bne	a0,a5,12a <find+0x78>
      if(de.inum == 0)
 22e:	da045783          	lhu	a5,-608(s0)
 232:	d3fd                	beqz	a5,218 <find+0x166>
      if(strcmp(de.name, ".") == 0 || strcmp(de.name, "..") == 0)
 234:	85d6                	mv	a1,s5
 236:	8552                	mv	a0,s4
 238:	00000097          	auipc	ra,0x0
 23c:	0e0080e7          	jalr	224(ra) # 318 <strcmp>
 240:	dd61                	beqz	a0,218 <find+0x166>
 242:	85de                	mv	a1,s7
 244:	8552                	mv	a0,s4
 246:	00000097          	auipc	ra,0x0
 24a:	0d2080e7          	jalr	210(ra) # 318 <strcmp>
 24e:	d569                	beqz	a0,218 <find+0x166>
      memmove(p, de.name, DIRSIZ);
 250:	4639                	li	a2,14
 252:	da240593          	addi	a1,s0,-606
 256:	855a                	mv	a0,s6
 258:	00000097          	auipc	ra,0x0
 25c:	264080e7          	jalr	612(ra) # 4bc <memmove>
      p[DIRSIZ] = 0;
 260:	000907a3          	sb	zero,15(s2)
      if(stat(buf, &st) < 0){
 264:	d8840593          	addi	a1,s0,-632
 268:	db040513          	addi	a0,s0,-592
 26c:	00000097          	auipc	ra,0x0
 270:	1c0080e7          	jalr	448(ra) # 42c <stat>
 274:	00054a63          	bltz	a0,288 <find+0x1d6>
      find(buf, target);
 278:	85ce                	mv	a1,s3
 27a:	db040513          	addi	a0,s0,-592
 27e:	00000097          	auipc	ra,0x0
 282:	e34080e7          	jalr	-460(ra) # b2 <find>
 286:	bf49                	j	218 <find+0x166>
        fprintf(2, "find: cannot stat %s\n", buf);
 288:	db040613          	addi	a2,s0,-592
 28c:	00001597          	auipc	a1,0x1
 290:	81c58593          	addi	a1,a1,-2020 # aa8 <malloc+0x100>
 294:	4509                	li	a0,2
 296:	00000097          	auipc	ra,0x0
 29a:	626080e7          	jalr	1574(ra) # 8bc <fprintf>
        continue;
 29e:	bfad                	j	218 <find+0x166>

00000000000002a0 <main>:

int
main(int argc, char *argv[]) {
 2a0:	1141                	addi	sp,sp,-16
 2a2:	e406                	sd	ra,8(sp)
 2a4:	e022                	sd	s0,0(sp)
 2a6:	0800                	addi	s0,sp,16
  if(argc != 3){
 2a8:	470d                	li	a4,3
 2aa:	02e50063          	beq	a0,a4,2ca <main+0x2a>
    fprintf(2, "Usage: find <directory> <filename>\n");
 2ae:	00001597          	auipc	a1,0x1
 2b2:	84258593          	addi	a1,a1,-1982 # af0 <malloc+0x148>
 2b6:	4509                	li	a0,2
 2b8:	00000097          	auipc	ra,0x0
 2bc:	604080e7          	jalr	1540(ra) # 8bc <fprintf>
    exit(1);
 2c0:	4505                	li	a0,1
 2c2:	00000097          	auipc	ra,0x0
 2c6:	2b0080e7          	jalr	688(ra) # 572 <exit>
 2ca:	87ae                	mv	a5,a1
  }
  find(argv[1], argv[2]);
 2cc:	698c                	ld	a1,16(a1)
 2ce:	6788                	ld	a0,8(a5)
 2d0:	00000097          	auipc	ra,0x0
 2d4:	de2080e7          	jalr	-542(ra) # b2 <find>
  exit(0);
 2d8:	4501                	li	a0,0
 2da:	00000097          	auipc	ra,0x0
 2de:	298080e7          	jalr	664(ra) # 572 <exit>

00000000000002e2 <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
 2e2:	1141                	addi	sp,sp,-16
 2e4:	e406                	sd	ra,8(sp)
 2e6:	e022                	sd	s0,0(sp)
 2e8:	0800                	addi	s0,sp,16
  extern int main();
  main();
 2ea:	00000097          	auipc	ra,0x0
 2ee:	fb6080e7          	jalr	-74(ra) # 2a0 <main>
  exit(0);
 2f2:	4501                	li	a0,0
 2f4:	00000097          	auipc	ra,0x0
 2f8:	27e080e7          	jalr	638(ra) # 572 <exit>

00000000000002fc <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 2fc:	1141                	addi	sp,sp,-16
 2fe:	e422                	sd	s0,8(sp)
 300:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 302:	87aa                	mv	a5,a0
 304:	0585                	addi	a1,a1,1
 306:	0785                	addi	a5,a5,1
 308:	fff5c703          	lbu	a4,-1(a1)
 30c:	fee78fa3          	sb	a4,-1(a5)
 310:	fb75                	bnez	a4,304 <strcpy+0x8>
    ;
  return os;
}
 312:	6422                	ld	s0,8(sp)
 314:	0141                	addi	sp,sp,16
 316:	8082                	ret

0000000000000318 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 318:	1141                	addi	sp,sp,-16
 31a:	e422                	sd	s0,8(sp)
 31c:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 31e:	00054783          	lbu	a5,0(a0)
 322:	cb91                	beqz	a5,336 <strcmp+0x1e>
 324:	0005c703          	lbu	a4,0(a1)
 328:	00f71763          	bne	a4,a5,336 <strcmp+0x1e>
    p++, q++;
 32c:	0505                	addi	a0,a0,1
 32e:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 330:	00054783          	lbu	a5,0(a0)
 334:	fbe5                	bnez	a5,324 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 336:	0005c503          	lbu	a0,0(a1)
}
 33a:	40a7853b          	subw	a0,a5,a0
 33e:	6422                	ld	s0,8(sp)
 340:	0141                	addi	sp,sp,16
 342:	8082                	ret

0000000000000344 <strlen>:

uint
strlen(const char *s)
{
 344:	1141                	addi	sp,sp,-16
 346:	e422                	sd	s0,8(sp)
 348:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 34a:	00054783          	lbu	a5,0(a0)
 34e:	cf91                	beqz	a5,36a <strlen+0x26>
 350:	0505                	addi	a0,a0,1
 352:	87aa                	mv	a5,a0
 354:	4685                	li	a3,1
 356:	9e89                	subw	a3,a3,a0
 358:	00f6853b          	addw	a0,a3,a5
 35c:	0785                	addi	a5,a5,1
 35e:	fff7c703          	lbu	a4,-1(a5)
 362:	fb7d                	bnez	a4,358 <strlen+0x14>
    ;
  return n;
}
 364:	6422                	ld	s0,8(sp)
 366:	0141                	addi	sp,sp,16
 368:	8082                	ret
  for(n = 0; s[n]; n++)
 36a:	4501                	li	a0,0
 36c:	bfe5                	j	364 <strlen+0x20>

000000000000036e <memset>:

void*
memset(void *dst, int c, uint n)
{
 36e:	1141                	addi	sp,sp,-16
 370:	e422                	sd	s0,8(sp)
 372:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 374:	ce09                	beqz	a2,38e <memset+0x20>
 376:	87aa                	mv	a5,a0
 378:	fff6071b          	addiw	a4,a2,-1
 37c:	1702                	slli	a4,a4,0x20
 37e:	9301                	srli	a4,a4,0x20
 380:	0705                	addi	a4,a4,1
 382:	972a                	add	a4,a4,a0
    cdst[i] = c;
 384:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 388:	0785                	addi	a5,a5,1
 38a:	fee79de3          	bne	a5,a4,384 <memset+0x16>
  }
  return dst;
}
 38e:	6422                	ld	s0,8(sp)
 390:	0141                	addi	sp,sp,16
 392:	8082                	ret

0000000000000394 <strchr>:

char*
strchr(const char *s, char c)
{
 394:	1141                	addi	sp,sp,-16
 396:	e422                	sd	s0,8(sp)
 398:	0800                	addi	s0,sp,16
  for(; *s; s++)
 39a:	00054783          	lbu	a5,0(a0)
 39e:	cb99                	beqz	a5,3b4 <strchr+0x20>
    if(*s == c)
 3a0:	00f58763          	beq	a1,a5,3ae <strchr+0x1a>
  for(; *s; s++)
 3a4:	0505                	addi	a0,a0,1
 3a6:	00054783          	lbu	a5,0(a0)
 3aa:	fbfd                	bnez	a5,3a0 <strchr+0xc>
      return (char*)s;
  return 0;
 3ac:	4501                	li	a0,0
}
 3ae:	6422                	ld	s0,8(sp)
 3b0:	0141                	addi	sp,sp,16
 3b2:	8082                	ret
  return 0;
 3b4:	4501                	li	a0,0
 3b6:	bfe5                	j	3ae <strchr+0x1a>

00000000000003b8 <gets>:

char*
gets(char *buf, int max)
{
 3b8:	711d                	addi	sp,sp,-96
 3ba:	ec86                	sd	ra,88(sp)
 3bc:	e8a2                	sd	s0,80(sp)
 3be:	e4a6                	sd	s1,72(sp)
 3c0:	e0ca                	sd	s2,64(sp)
 3c2:	fc4e                	sd	s3,56(sp)
 3c4:	f852                	sd	s4,48(sp)
 3c6:	f456                	sd	s5,40(sp)
 3c8:	f05a                	sd	s6,32(sp)
 3ca:	ec5e                	sd	s7,24(sp)
 3cc:	1080                	addi	s0,sp,96
 3ce:	8baa                	mv	s7,a0
 3d0:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3d2:	892a                	mv	s2,a0
 3d4:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 3d6:	4aa9                	li	s5,10
 3d8:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 3da:	89a6                	mv	s3,s1
 3dc:	2485                	addiw	s1,s1,1
 3de:	0344d863          	bge	s1,s4,40e <gets+0x56>
    cc = read(0, &c, 1);
 3e2:	4605                	li	a2,1
 3e4:	faf40593          	addi	a1,s0,-81
 3e8:	4501                	li	a0,0
 3ea:	00000097          	auipc	ra,0x0
 3ee:	1a0080e7          	jalr	416(ra) # 58a <read>
    if(cc < 1)
 3f2:	00a05e63          	blez	a0,40e <gets+0x56>
    buf[i++] = c;
 3f6:	faf44783          	lbu	a5,-81(s0)
 3fa:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 3fe:	01578763          	beq	a5,s5,40c <gets+0x54>
 402:	0905                	addi	s2,s2,1
 404:	fd679be3          	bne	a5,s6,3da <gets+0x22>
  for(i=0; i+1 < max; ){
 408:	89a6                	mv	s3,s1
 40a:	a011                	j	40e <gets+0x56>
 40c:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 40e:	99de                	add	s3,s3,s7
 410:	00098023          	sb	zero,0(s3)
  return buf;
}
 414:	855e                	mv	a0,s7
 416:	60e6                	ld	ra,88(sp)
 418:	6446                	ld	s0,80(sp)
 41a:	64a6                	ld	s1,72(sp)
 41c:	6906                	ld	s2,64(sp)
 41e:	79e2                	ld	s3,56(sp)
 420:	7a42                	ld	s4,48(sp)
 422:	7aa2                	ld	s5,40(sp)
 424:	7b02                	ld	s6,32(sp)
 426:	6be2                	ld	s7,24(sp)
 428:	6125                	addi	sp,sp,96
 42a:	8082                	ret

000000000000042c <stat>:

int
stat(const char *n, struct stat *st)
{
 42c:	1101                	addi	sp,sp,-32
 42e:	ec06                	sd	ra,24(sp)
 430:	e822                	sd	s0,16(sp)
 432:	e426                	sd	s1,8(sp)
 434:	e04a                	sd	s2,0(sp)
 436:	1000                	addi	s0,sp,32
 438:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 43a:	4581                	li	a1,0
 43c:	00000097          	auipc	ra,0x0
 440:	176080e7          	jalr	374(ra) # 5b2 <open>
  if(fd < 0)
 444:	02054563          	bltz	a0,46e <stat+0x42>
 448:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 44a:	85ca                	mv	a1,s2
 44c:	00000097          	auipc	ra,0x0
 450:	17e080e7          	jalr	382(ra) # 5ca <fstat>
 454:	892a                	mv	s2,a0
  close(fd);
 456:	8526                	mv	a0,s1
 458:	00000097          	auipc	ra,0x0
 45c:	142080e7          	jalr	322(ra) # 59a <close>
  return r;
}
 460:	854a                	mv	a0,s2
 462:	60e2                	ld	ra,24(sp)
 464:	6442                	ld	s0,16(sp)
 466:	64a2                	ld	s1,8(sp)
 468:	6902                	ld	s2,0(sp)
 46a:	6105                	addi	sp,sp,32
 46c:	8082                	ret
    return -1;
 46e:	597d                	li	s2,-1
 470:	bfc5                	j	460 <stat+0x34>

0000000000000472 <atoi>:

int
atoi(const char *s)
{
 472:	1141                	addi	sp,sp,-16
 474:	e422                	sd	s0,8(sp)
 476:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 478:	00054603          	lbu	a2,0(a0)
 47c:	fd06079b          	addiw	a5,a2,-48
 480:	0ff7f793          	andi	a5,a5,255
 484:	4725                	li	a4,9
 486:	02f76963          	bltu	a4,a5,4b8 <atoi+0x46>
 48a:	86aa                	mv	a3,a0
  n = 0;
 48c:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 48e:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 490:	0685                	addi	a3,a3,1
 492:	0025179b          	slliw	a5,a0,0x2
 496:	9fa9                	addw	a5,a5,a0
 498:	0017979b          	slliw	a5,a5,0x1
 49c:	9fb1                	addw	a5,a5,a2
 49e:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 4a2:	0006c603          	lbu	a2,0(a3)
 4a6:	fd06071b          	addiw	a4,a2,-48
 4aa:	0ff77713          	andi	a4,a4,255
 4ae:	fee5f1e3          	bgeu	a1,a4,490 <atoi+0x1e>
  return n;
}
 4b2:	6422                	ld	s0,8(sp)
 4b4:	0141                	addi	sp,sp,16
 4b6:	8082                	ret
  n = 0;
 4b8:	4501                	li	a0,0
 4ba:	bfe5                	j	4b2 <atoi+0x40>

00000000000004bc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4bc:	1141                	addi	sp,sp,-16
 4be:	e422                	sd	s0,8(sp)
 4c0:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 4c2:	02b57663          	bgeu	a0,a1,4ee <memmove+0x32>
    while(n-- > 0)
 4c6:	02c05163          	blez	a2,4e8 <memmove+0x2c>
 4ca:	fff6079b          	addiw	a5,a2,-1
 4ce:	1782                	slli	a5,a5,0x20
 4d0:	9381                	srli	a5,a5,0x20
 4d2:	0785                	addi	a5,a5,1
 4d4:	97aa                	add	a5,a5,a0
  dst = vdst;
 4d6:	872a                	mv	a4,a0
      *dst++ = *src++;
 4d8:	0585                	addi	a1,a1,1
 4da:	0705                	addi	a4,a4,1
 4dc:	fff5c683          	lbu	a3,-1(a1)
 4e0:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 4e4:	fee79ae3          	bne	a5,a4,4d8 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 4e8:	6422                	ld	s0,8(sp)
 4ea:	0141                	addi	sp,sp,16
 4ec:	8082                	ret
    dst += n;
 4ee:	00c50733          	add	a4,a0,a2
    src += n;
 4f2:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 4f4:	fec05ae3          	blez	a2,4e8 <memmove+0x2c>
 4f8:	fff6079b          	addiw	a5,a2,-1
 4fc:	1782                	slli	a5,a5,0x20
 4fe:	9381                	srli	a5,a5,0x20
 500:	fff7c793          	not	a5,a5
 504:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 506:	15fd                	addi	a1,a1,-1
 508:	177d                	addi	a4,a4,-1
 50a:	0005c683          	lbu	a3,0(a1)
 50e:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 512:	fee79ae3          	bne	a5,a4,506 <memmove+0x4a>
 516:	bfc9                	j	4e8 <memmove+0x2c>

0000000000000518 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 518:	1141                	addi	sp,sp,-16
 51a:	e422                	sd	s0,8(sp)
 51c:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 51e:	ca05                	beqz	a2,54e <memcmp+0x36>
 520:	fff6069b          	addiw	a3,a2,-1
 524:	1682                	slli	a3,a3,0x20
 526:	9281                	srli	a3,a3,0x20
 528:	0685                	addi	a3,a3,1
 52a:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 52c:	00054783          	lbu	a5,0(a0)
 530:	0005c703          	lbu	a4,0(a1)
 534:	00e79863          	bne	a5,a4,544 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 538:	0505                	addi	a0,a0,1
    p2++;
 53a:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 53c:	fed518e3          	bne	a0,a3,52c <memcmp+0x14>
  }
  return 0;
 540:	4501                	li	a0,0
 542:	a019                	j	548 <memcmp+0x30>
      return *p1 - *p2;
 544:	40e7853b          	subw	a0,a5,a4
}
 548:	6422                	ld	s0,8(sp)
 54a:	0141                	addi	sp,sp,16
 54c:	8082                	ret
  return 0;
 54e:	4501                	li	a0,0
 550:	bfe5                	j	548 <memcmp+0x30>

0000000000000552 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 552:	1141                	addi	sp,sp,-16
 554:	e406                	sd	ra,8(sp)
 556:	e022                	sd	s0,0(sp)
 558:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 55a:	00000097          	auipc	ra,0x0
 55e:	f62080e7          	jalr	-158(ra) # 4bc <memmove>
}
 562:	60a2                	ld	ra,8(sp)
 564:	6402                	ld	s0,0(sp)
 566:	0141                	addi	sp,sp,16
 568:	8082                	ret

000000000000056a <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 56a:	4885                	li	a7,1
 ecall
 56c:	00000073          	ecall
 ret
 570:	8082                	ret

0000000000000572 <exit>:
.global exit
exit:
 li a7, SYS_exit
 572:	4889                	li	a7,2
 ecall
 574:	00000073          	ecall
 ret
 578:	8082                	ret

000000000000057a <wait>:
.global wait
wait:
 li a7, SYS_wait
 57a:	488d                	li	a7,3
 ecall
 57c:	00000073          	ecall
 ret
 580:	8082                	ret

0000000000000582 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 582:	4891                	li	a7,4
 ecall
 584:	00000073          	ecall
 ret
 588:	8082                	ret

000000000000058a <read>:
.global read
read:
 li a7, SYS_read
 58a:	4895                	li	a7,5
 ecall
 58c:	00000073          	ecall
 ret
 590:	8082                	ret

0000000000000592 <write>:
.global write
write:
 li a7, SYS_write
 592:	48c1                	li	a7,16
 ecall
 594:	00000073          	ecall
 ret
 598:	8082                	ret

000000000000059a <close>:
.global close
close:
 li a7, SYS_close
 59a:	48d5                	li	a7,21
 ecall
 59c:	00000073          	ecall
 ret
 5a0:	8082                	ret

00000000000005a2 <kill>:
.global kill
kill:
 li a7, SYS_kill
 5a2:	4899                	li	a7,6
 ecall
 5a4:	00000073          	ecall
 ret
 5a8:	8082                	ret

00000000000005aa <exec>:
.global exec
exec:
 li a7, SYS_exec
 5aa:	489d                	li	a7,7
 ecall
 5ac:	00000073          	ecall
 ret
 5b0:	8082                	ret

00000000000005b2 <open>:
.global open
open:
 li a7, SYS_open
 5b2:	48bd                	li	a7,15
 ecall
 5b4:	00000073          	ecall
 ret
 5b8:	8082                	ret

00000000000005ba <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 5ba:	48c5                	li	a7,17
 ecall
 5bc:	00000073          	ecall
 ret
 5c0:	8082                	ret

00000000000005c2 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 5c2:	48c9                	li	a7,18
 ecall
 5c4:	00000073          	ecall
 ret
 5c8:	8082                	ret

00000000000005ca <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 5ca:	48a1                	li	a7,8
 ecall
 5cc:	00000073          	ecall
 ret
 5d0:	8082                	ret

00000000000005d2 <link>:
.global link
link:
 li a7, SYS_link
 5d2:	48cd                	li	a7,19
 ecall
 5d4:	00000073          	ecall
 ret
 5d8:	8082                	ret

00000000000005da <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 5da:	48d1                	li	a7,20
 ecall
 5dc:	00000073          	ecall
 ret
 5e0:	8082                	ret

00000000000005e2 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 5e2:	48a5                	li	a7,9
 ecall
 5e4:	00000073          	ecall
 ret
 5e8:	8082                	ret

00000000000005ea <dup>:
.global dup
dup:
 li a7, SYS_dup
 5ea:	48a9                	li	a7,10
 ecall
 5ec:	00000073          	ecall
 ret
 5f0:	8082                	ret

00000000000005f2 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 5f2:	48ad                	li	a7,11
 ecall
 5f4:	00000073          	ecall
 ret
 5f8:	8082                	ret

00000000000005fa <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 5fa:	48b1                	li	a7,12
 ecall
 5fc:	00000073          	ecall
 ret
 600:	8082                	ret

0000000000000602 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 602:	48b5                	li	a7,13
 ecall
 604:	00000073          	ecall
 ret
 608:	8082                	ret

000000000000060a <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 60a:	48b9                	li	a7,14
 ecall
 60c:	00000073          	ecall
 ret
 610:	8082                	ret

0000000000000612 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 612:	1101                	addi	sp,sp,-32
 614:	ec06                	sd	ra,24(sp)
 616:	e822                	sd	s0,16(sp)
 618:	1000                	addi	s0,sp,32
 61a:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 61e:	4605                	li	a2,1
 620:	fef40593          	addi	a1,s0,-17
 624:	00000097          	auipc	ra,0x0
 628:	f6e080e7          	jalr	-146(ra) # 592 <write>
}
 62c:	60e2                	ld	ra,24(sp)
 62e:	6442                	ld	s0,16(sp)
 630:	6105                	addi	sp,sp,32
 632:	8082                	ret

0000000000000634 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 634:	7139                	addi	sp,sp,-64
 636:	fc06                	sd	ra,56(sp)
 638:	f822                	sd	s0,48(sp)
 63a:	f426                	sd	s1,40(sp)
 63c:	f04a                	sd	s2,32(sp)
 63e:	ec4e                	sd	s3,24(sp)
 640:	0080                	addi	s0,sp,64
 642:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 644:	c299                	beqz	a3,64a <printint+0x16>
 646:	0805c863          	bltz	a1,6d6 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 64a:	2581                	sext.w	a1,a1
  neg = 0;
 64c:	4881                	li	a7,0
 64e:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 652:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 654:	2601                	sext.w	a2,a2
 656:	00000517          	auipc	a0,0x0
 65a:	4ca50513          	addi	a0,a0,1226 # b20 <digits>
 65e:	883a                	mv	a6,a4
 660:	2705                	addiw	a4,a4,1
 662:	02c5f7bb          	remuw	a5,a1,a2
 666:	1782                	slli	a5,a5,0x20
 668:	9381                	srli	a5,a5,0x20
 66a:	97aa                	add	a5,a5,a0
 66c:	0007c783          	lbu	a5,0(a5)
 670:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 674:	0005879b          	sext.w	a5,a1
 678:	02c5d5bb          	divuw	a1,a1,a2
 67c:	0685                	addi	a3,a3,1
 67e:	fec7f0e3          	bgeu	a5,a2,65e <printint+0x2a>
  if(neg)
 682:	00088b63          	beqz	a7,698 <printint+0x64>
    buf[i++] = '-';
 686:	fd040793          	addi	a5,s0,-48
 68a:	973e                	add	a4,a4,a5
 68c:	02d00793          	li	a5,45
 690:	fef70823          	sb	a5,-16(a4)
 694:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 698:	02e05863          	blez	a4,6c8 <printint+0x94>
 69c:	fc040793          	addi	a5,s0,-64
 6a0:	00e78933          	add	s2,a5,a4
 6a4:	fff78993          	addi	s3,a5,-1
 6a8:	99ba                	add	s3,s3,a4
 6aa:	377d                	addiw	a4,a4,-1
 6ac:	1702                	slli	a4,a4,0x20
 6ae:	9301                	srli	a4,a4,0x20
 6b0:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 6b4:	fff94583          	lbu	a1,-1(s2)
 6b8:	8526                	mv	a0,s1
 6ba:	00000097          	auipc	ra,0x0
 6be:	f58080e7          	jalr	-168(ra) # 612 <putc>
  while(--i >= 0)
 6c2:	197d                	addi	s2,s2,-1
 6c4:	ff3918e3          	bne	s2,s3,6b4 <printint+0x80>
}
 6c8:	70e2                	ld	ra,56(sp)
 6ca:	7442                	ld	s0,48(sp)
 6cc:	74a2                	ld	s1,40(sp)
 6ce:	7902                	ld	s2,32(sp)
 6d0:	69e2                	ld	s3,24(sp)
 6d2:	6121                	addi	sp,sp,64
 6d4:	8082                	ret
    x = -xx;
 6d6:	40b005bb          	negw	a1,a1
    neg = 1;
 6da:	4885                	li	a7,1
    x = -xx;
 6dc:	bf8d                	j	64e <printint+0x1a>

00000000000006de <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 6de:	7119                	addi	sp,sp,-128
 6e0:	fc86                	sd	ra,120(sp)
 6e2:	f8a2                	sd	s0,112(sp)
 6e4:	f4a6                	sd	s1,104(sp)
 6e6:	f0ca                	sd	s2,96(sp)
 6e8:	ecce                	sd	s3,88(sp)
 6ea:	e8d2                	sd	s4,80(sp)
 6ec:	e4d6                	sd	s5,72(sp)
 6ee:	e0da                	sd	s6,64(sp)
 6f0:	fc5e                	sd	s7,56(sp)
 6f2:	f862                	sd	s8,48(sp)
 6f4:	f466                	sd	s9,40(sp)
 6f6:	f06a                	sd	s10,32(sp)
 6f8:	ec6e                	sd	s11,24(sp)
 6fa:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 6fc:	0005c903          	lbu	s2,0(a1)
 700:	18090f63          	beqz	s2,89e <vprintf+0x1c0>
 704:	8aaa                	mv	s5,a0
 706:	8b32                	mv	s6,a2
 708:	00158493          	addi	s1,a1,1
  state = 0;
 70c:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 70e:	02500a13          	li	s4,37
      if(c == 'd'){
 712:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 716:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 71a:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 71e:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 722:	00000b97          	auipc	s7,0x0
 726:	3feb8b93          	addi	s7,s7,1022 # b20 <digits>
 72a:	a839                	j	748 <vprintf+0x6a>
        putc(fd, c);
 72c:	85ca                	mv	a1,s2
 72e:	8556                	mv	a0,s5
 730:	00000097          	auipc	ra,0x0
 734:	ee2080e7          	jalr	-286(ra) # 612 <putc>
 738:	a019                	j	73e <vprintf+0x60>
    } else if(state == '%'){
 73a:	01498f63          	beq	s3,s4,758 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 73e:	0485                	addi	s1,s1,1
 740:	fff4c903          	lbu	s2,-1(s1)
 744:	14090d63          	beqz	s2,89e <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 748:	0009079b          	sext.w	a5,s2
    if(state == 0){
 74c:	fe0997e3          	bnez	s3,73a <vprintf+0x5c>
      if(c == '%'){
 750:	fd479ee3          	bne	a5,s4,72c <vprintf+0x4e>
        state = '%';
 754:	89be                	mv	s3,a5
 756:	b7e5                	j	73e <vprintf+0x60>
      if(c == 'd'){
 758:	05878063          	beq	a5,s8,798 <vprintf+0xba>
      } else if(c == 'l') {
 75c:	05978c63          	beq	a5,s9,7b4 <vprintf+0xd6>
      } else if(c == 'x') {
 760:	07a78863          	beq	a5,s10,7d0 <vprintf+0xf2>
      } else if(c == 'p') {
 764:	09b78463          	beq	a5,s11,7ec <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 768:	07300713          	li	a4,115
 76c:	0ce78663          	beq	a5,a4,838 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 770:	06300713          	li	a4,99
 774:	0ee78e63          	beq	a5,a4,870 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 778:	11478863          	beq	a5,s4,888 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 77c:	85d2                	mv	a1,s4
 77e:	8556                	mv	a0,s5
 780:	00000097          	auipc	ra,0x0
 784:	e92080e7          	jalr	-366(ra) # 612 <putc>
        putc(fd, c);
 788:	85ca                	mv	a1,s2
 78a:	8556                	mv	a0,s5
 78c:	00000097          	auipc	ra,0x0
 790:	e86080e7          	jalr	-378(ra) # 612 <putc>
      }
      state = 0;
 794:	4981                	li	s3,0
 796:	b765                	j	73e <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 798:	008b0913          	addi	s2,s6,8
 79c:	4685                	li	a3,1
 79e:	4629                	li	a2,10
 7a0:	000b2583          	lw	a1,0(s6)
 7a4:	8556                	mv	a0,s5
 7a6:	00000097          	auipc	ra,0x0
 7aa:	e8e080e7          	jalr	-370(ra) # 634 <printint>
 7ae:	8b4a                	mv	s6,s2
      state = 0;
 7b0:	4981                	li	s3,0
 7b2:	b771                	j	73e <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 7b4:	008b0913          	addi	s2,s6,8
 7b8:	4681                	li	a3,0
 7ba:	4629                	li	a2,10
 7bc:	000b2583          	lw	a1,0(s6)
 7c0:	8556                	mv	a0,s5
 7c2:	00000097          	auipc	ra,0x0
 7c6:	e72080e7          	jalr	-398(ra) # 634 <printint>
 7ca:	8b4a                	mv	s6,s2
      state = 0;
 7cc:	4981                	li	s3,0
 7ce:	bf85                	j	73e <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 7d0:	008b0913          	addi	s2,s6,8
 7d4:	4681                	li	a3,0
 7d6:	4641                	li	a2,16
 7d8:	000b2583          	lw	a1,0(s6)
 7dc:	8556                	mv	a0,s5
 7de:	00000097          	auipc	ra,0x0
 7e2:	e56080e7          	jalr	-426(ra) # 634 <printint>
 7e6:	8b4a                	mv	s6,s2
      state = 0;
 7e8:	4981                	li	s3,0
 7ea:	bf91                	j	73e <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 7ec:	008b0793          	addi	a5,s6,8
 7f0:	f8f43423          	sd	a5,-120(s0)
 7f4:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 7f8:	03000593          	li	a1,48
 7fc:	8556                	mv	a0,s5
 7fe:	00000097          	auipc	ra,0x0
 802:	e14080e7          	jalr	-492(ra) # 612 <putc>
  putc(fd, 'x');
 806:	85ea                	mv	a1,s10
 808:	8556                	mv	a0,s5
 80a:	00000097          	auipc	ra,0x0
 80e:	e08080e7          	jalr	-504(ra) # 612 <putc>
 812:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 814:	03c9d793          	srli	a5,s3,0x3c
 818:	97de                	add	a5,a5,s7
 81a:	0007c583          	lbu	a1,0(a5)
 81e:	8556                	mv	a0,s5
 820:	00000097          	auipc	ra,0x0
 824:	df2080e7          	jalr	-526(ra) # 612 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 828:	0992                	slli	s3,s3,0x4
 82a:	397d                	addiw	s2,s2,-1
 82c:	fe0914e3          	bnez	s2,814 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 830:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 834:	4981                	li	s3,0
 836:	b721                	j	73e <vprintf+0x60>
        s = va_arg(ap, char*);
 838:	008b0993          	addi	s3,s6,8
 83c:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 840:	02090163          	beqz	s2,862 <vprintf+0x184>
        while(*s != 0){
 844:	00094583          	lbu	a1,0(s2)
 848:	c9a1                	beqz	a1,898 <vprintf+0x1ba>
          putc(fd, *s);
 84a:	8556                	mv	a0,s5
 84c:	00000097          	auipc	ra,0x0
 850:	dc6080e7          	jalr	-570(ra) # 612 <putc>
          s++;
 854:	0905                	addi	s2,s2,1
        while(*s != 0){
 856:	00094583          	lbu	a1,0(s2)
 85a:	f9e5                	bnez	a1,84a <vprintf+0x16c>
        s = va_arg(ap, char*);
 85c:	8b4e                	mv	s6,s3
      state = 0;
 85e:	4981                	li	s3,0
 860:	bdf9                	j	73e <vprintf+0x60>
          s = "(null)";
 862:	00000917          	auipc	s2,0x0
 866:	2b690913          	addi	s2,s2,694 # b18 <malloc+0x170>
        while(*s != 0){
 86a:	02800593          	li	a1,40
 86e:	bff1                	j	84a <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 870:	008b0913          	addi	s2,s6,8
 874:	000b4583          	lbu	a1,0(s6)
 878:	8556                	mv	a0,s5
 87a:	00000097          	auipc	ra,0x0
 87e:	d98080e7          	jalr	-616(ra) # 612 <putc>
 882:	8b4a                	mv	s6,s2
      state = 0;
 884:	4981                	li	s3,0
 886:	bd65                	j	73e <vprintf+0x60>
        putc(fd, c);
 888:	85d2                	mv	a1,s4
 88a:	8556                	mv	a0,s5
 88c:	00000097          	auipc	ra,0x0
 890:	d86080e7          	jalr	-634(ra) # 612 <putc>
      state = 0;
 894:	4981                	li	s3,0
 896:	b565                	j	73e <vprintf+0x60>
        s = va_arg(ap, char*);
 898:	8b4e                	mv	s6,s3
      state = 0;
 89a:	4981                	li	s3,0
 89c:	b54d                	j	73e <vprintf+0x60>
    }
  }
}
 89e:	70e6                	ld	ra,120(sp)
 8a0:	7446                	ld	s0,112(sp)
 8a2:	74a6                	ld	s1,104(sp)
 8a4:	7906                	ld	s2,96(sp)
 8a6:	69e6                	ld	s3,88(sp)
 8a8:	6a46                	ld	s4,80(sp)
 8aa:	6aa6                	ld	s5,72(sp)
 8ac:	6b06                	ld	s6,64(sp)
 8ae:	7be2                	ld	s7,56(sp)
 8b0:	7c42                	ld	s8,48(sp)
 8b2:	7ca2                	ld	s9,40(sp)
 8b4:	7d02                	ld	s10,32(sp)
 8b6:	6de2                	ld	s11,24(sp)
 8b8:	6109                	addi	sp,sp,128
 8ba:	8082                	ret

00000000000008bc <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 8bc:	715d                	addi	sp,sp,-80
 8be:	ec06                	sd	ra,24(sp)
 8c0:	e822                	sd	s0,16(sp)
 8c2:	1000                	addi	s0,sp,32
 8c4:	e010                	sd	a2,0(s0)
 8c6:	e414                	sd	a3,8(s0)
 8c8:	e818                	sd	a4,16(s0)
 8ca:	ec1c                	sd	a5,24(s0)
 8cc:	03043023          	sd	a6,32(s0)
 8d0:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 8d4:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 8d8:	8622                	mv	a2,s0
 8da:	00000097          	auipc	ra,0x0
 8de:	e04080e7          	jalr	-508(ra) # 6de <vprintf>
}
 8e2:	60e2                	ld	ra,24(sp)
 8e4:	6442                	ld	s0,16(sp)
 8e6:	6161                	addi	sp,sp,80
 8e8:	8082                	ret

00000000000008ea <printf>:

void
printf(const char *fmt, ...)
{
 8ea:	711d                	addi	sp,sp,-96
 8ec:	ec06                	sd	ra,24(sp)
 8ee:	e822                	sd	s0,16(sp)
 8f0:	1000                	addi	s0,sp,32
 8f2:	e40c                	sd	a1,8(s0)
 8f4:	e810                	sd	a2,16(s0)
 8f6:	ec14                	sd	a3,24(s0)
 8f8:	f018                	sd	a4,32(s0)
 8fa:	f41c                	sd	a5,40(s0)
 8fc:	03043823          	sd	a6,48(s0)
 900:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 904:	00840613          	addi	a2,s0,8
 908:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 90c:	85aa                	mv	a1,a0
 90e:	4505                	li	a0,1
 910:	00000097          	auipc	ra,0x0
 914:	dce080e7          	jalr	-562(ra) # 6de <vprintf>
}
 918:	60e2                	ld	ra,24(sp)
 91a:	6442                	ld	s0,16(sp)
 91c:	6125                	addi	sp,sp,96
 91e:	8082                	ret

0000000000000920 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 920:	1141                	addi	sp,sp,-16
 922:	e422                	sd	s0,8(sp)
 924:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 926:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 92a:	00000797          	auipc	a5,0x0
 92e:	6d67b783          	ld	a5,1750(a5) # 1000 <freep>
 932:	a805                	j	962 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 934:	4618                	lw	a4,8(a2)
 936:	9db9                	addw	a1,a1,a4
 938:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 93c:	6398                	ld	a4,0(a5)
 93e:	6318                	ld	a4,0(a4)
 940:	fee53823          	sd	a4,-16(a0)
 944:	a091                	j	988 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 946:	ff852703          	lw	a4,-8(a0)
 94a:	9e39                	addw	a2,a2,a4
 94c:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 94e:	ff053703          	ld	a4,-16(a0)
 952:	e398                	sd	a4,0(a5)
 954:	a099                	j	99a <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 956:	6398                	ld	a4,0(a5)
 958:	00e7e463          	bltu	a5,a4,960 <free+0x40>
 95c:	00e6ea63          	bltu	a3,a4,970 <free+0x50>
{
 960:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 962:	fed7fae3          	bgeu	a5,a3,956 <free+0x36>
 966:	6398                	ld	a4,0(a5)
 968:	00e6e463          	bltu	a3,a4,970 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 96c:	fee7eae3          	bltu	a5,a4,960 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 970:	ff852583          	lw	a1,-8(a0)
 974:	6390                	ld	a2,0(a5)
 976:	02059713          	slli	a4,a1,0x20
 97a:	9301                	srli	a4,a4,0x20
 97c:	0712                	slli	a4,a4,0x4
 97e:	9736                	add	a4,a4,a3
 980:	fae60ae3          	beq	a2,a4,934 <free+0x14>
    bp->s.ptr = p->s.ptr;
 984:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 988:	4790                	lw	a2,8(a5)
 98a:	02061713          	slli	a4,a2,0x20
 98e:	9301                	srli	a4,a4,0x20
 990:	0712                	slli	a4,a4,0x4
 992:	973e                	add	a4,a4,a5
 994:	fae689e3          	beq	a3,a4,946 <free+0x26>
  } else
    p->s.ptr = bp;
 998:	e394                	sd	a3,0(a5)
  freep = p;
 99a:	00000717          	auipc	a4,0x0
 99e:	66f73323          	sd	a5,1638(a4) # 1000 <freep>
}
 9a2:	6422                	ld	s0,8(sp)
 9a4:	0141                	addi	sp,sp,16
 9a6:	8082                	ret

00000000000009a8 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9a8:	7139                	addi	sp,sp,-64
 9aa:	fc06                	sd	ra,56(sp)
 9ac:	f822                	sd	s0,48(sp)
 9ae:	f426                	sd	s1,40(sp)
 9b0:	f04a                	sd	s2,32(sp)
 9b2:	ec4e                	sd	s3,24(sp)
 9b4:	e852                	sd	s4,16(sp)
 9b6:	e456                	sd	s5,8(sp)
 9b8:	e05a                	sd	s6,0(sp)
 9ba:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9bc:	02051493          	slli	s1,a0,0x20
 9c0:	9081                	srli	s1,s1,0x20
 9c2:	04bd                	addi	s1,s1,15
 9c4:	8091                	srli	s1,s1,0x4
 9c6:	0014899b          	addiw	s3,s1,1
 9ca:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 9cc:	00000517          	auipc	a0,0x0
 9d0:	63453503          	ld	a0,1588(a0) # 1000 <freep>
 9d4:	c515                	beqz	a0,a00 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d6:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9d8:	4798                	lw	a4,8(a5)
 9da:	02977f63          	bgeu	a4,s1,a18 <malloc+0x70>
 9de:	8a4e                	mv	s4,s3
 9e0:	0009871b          	sext.w	a4,s3
 9e4:	6685                	lui	a3,0x1
 9e6:	00d77363          	bgeu	a4,a3,9ec <malloc+0x44>
 9ea:	6a05                	lui	s4,0x1
 9ec:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 9f0:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9f4:	00000917          	auipc	s2,0x0
 9f8:	60c90913          	addi	s2,s2,1548 # 1000 <freep>
  if(p == (char*)-1)
 9fc:	5afd                	li	s5,-1
 9fe:	a88d                	j	a70 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 a00:	00000797          	auipc	a5,0x0
 a04:	62078793          	addi	a5,a5,1568 # 1020 <base>
 a08:	00000717          	auipc	a4,0x0
 a0c:	5ef73c23          	sd	a5,1528(a4) # 1000 <freep>
 a10:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 a12:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 a16:	b7e1                	j	9de <malloc+0x36>
      if(p->s.size == nunits)
 a18:	02e48b63          	beq	s1,a4,a4e <malloc+0xa6>
        p->s.size -= nunits;
 a1c:	4137073b          	subw	a4,a4,s3
 a20:	c798                	sw	a4,8(a5)
        p += p->s.size;
 a22:	1702                	slli	a4,a4,0x20
 a24:	9301                	srli	a4,a4,0x20
 a26:	0712                	slli	a4,a4,0x4
 a28:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 a2a:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 a2e:	00000717          	auipc	a4,0x0
 a32:	5ca73923          	sd	a0,1490(a4) # 1000 <freep>
      return (void*)(p + 1);
 a36:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a3a:	70e2                	ld	ra,56(sp)
 a3c:	7442                	ld	s0,48(sp)
 a3e:	74a2                	ld	s1,40(sp)
 a40:	7902                	ld	s2,32(sp)
 a42:	69e2                	ld	s3,24(sp)
 a44:	6a42                	ld	s4,16(sp)
 a46:	6aa2                	ld	s5,8(sp)
 a48:	6b02                	ld	s6,0(sp)
 a4a:	6121                	addi	sp,sp,64
 a4c:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 a4e:	6398                	ld	a4,0(a5)
 a50:	e118                	sd	a4,0(a0)
 a52:	bff1                	j	a2e <malloc+0x86>
  hp->s.size = nu;
 a54:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 a58:	0541                	addi	a0,a0,16
 a5a:	00000097          	auipc	ra,0x0
 a5e:	ec6080e7          	jalr	-314(ra) # 920 <free>
  return freep;
 a62:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 a66:	d971                	beqz	a0,a3a <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a68:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a6a:	4798                	lw	a4,8(a5)
 a6c:	fa9776e3          	bgeu	a4,s1,a18 <malloc+0x70>
    if(p == freep)
 a70:	00093703          	ld	a4,0(s2)
 a74:	853e                	mv	a0,a5
 a76:	fef719e3          	bne	a4,a5,a68 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 a7a:	8552                	mv	a0,s4
 a7c:	00000097          	auipc	ra,0x0
 a80:	b7e080e7          	jalr	-1154(ra) # 5fa <sbrk>
  if(p == (char*)-1)
 a84:	fd5518e3          	bne	a0,s5,a54 <malloc+0xac>
        return 0;
 a88:	4501                	li	a0,0
 a8a:	bf45                	j	a3a <malloc+0x92>
