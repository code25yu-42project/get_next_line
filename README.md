# get_next_line

## 소개

`get_next_line` 프로젝트는 파일 디스크립터(fd)로부터 한 줄씩 읽어오는 C 함수 `get_next_line()`을 구현하는 과제입니다. 여러 파일 디스크립터를 동시에 처리할 수 있으며, 동적 메모리 관리와 static 변수의 활용, 그리고 효율적인 버퍼링이 핵심입니다.

---

## 파일 구조

```
Makefile
README.md
docs/
  00_requirements.md    # 프로젝트 요구사항 및 규칙
  01_study.md           # 학습 자료
includes/
  get_next_line.h       # 함수 선언 및 자료구조 정의
srcs/
  get_next_line.c.      # 구현한 함수 소스 파일
  get_next_line_utils.c
test/
  main.c                # 여러 파일 디스크립터를 테스트하는 예제
  tests.sh              # 테스트 스크립트
  test0.txt             # 테스트용 파일들
  test1.txt
  test2.txt
  test3.txt
```

---

## 함수 설명

```c
char *get_next_line(int fd);
```
- 한 줄(`\n` 포함)을 읽어서 반환합니다.
- 더 이상 읽을 줄이 없거나 오류가 발생하면 `NULL`을 반환합니다.

---

## 빌드 및 실행

```sh
cd srcs
make        # 정적 라이브러리(get_next_line.a) 생성
make run    # 테스트 프로그램(get_next_line) 실행
make clean  # 빌드 아티팩트 삭제
make fclean # 정적 라이브러리 및 빌드 아티팩트 삭제
make re     # 정적 라이브러리 재빌드
```


---

## 테스트

- 다양한 `BUFFER_SIZE`로 테스트할 수 있습니다:
  ```sh
  make fclean
  make run CFLAGS="-D BUFFER_SIZE=42"
  ```
- 여러 개의 파일 디스크립터를 동시에 읽는 것도 지원합니다.

---