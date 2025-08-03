
---

# Get Next Line 요구사항

## 1. 프로젝트 개요

* **목표**: 파일 디스크립터로부터 한 줄씩 읽어오는 `get_next_line()` 함수 구현하고 `static` 변수 개념을 활용하여 상태를 유지하는 방식 학습.
* **출처**: 42 School Get Next Line (version 12.0)
---

## 2. 공통 규칙

* C 언어로 작성할 것.
* 메모리 누수 및 예외(세그폴트, 더블프리 등) 없이 안정적으로 동작해야 함.
* Makefile 제출 필수, `-Wall -Wextra -Werror` 컴파일 옵션 사용.
* Makefile에 기본 규칙 필수: `$(NAME)`, `all`, `clean`, `fclean`, `re`.
* `libft` 사용 허용:
  * `libft/` 폴더에 복사
  * 해당 Makefile 통해 먼저 libft 빌드 후 메인 프로젝트 빌드

---

## 3. 필수 파트

### 3.1 함수 시그니처

```c
char *get_next_line(int fd);
```

### 3.2 제출 파일

* `get_next_line.c`
* `get_next_line_utils.c`
* `get_next_line.h`

### 3.3 함수 동작

* 한 줄(`\n` 포함)을 읽어서 반환
* 더 이상 읽을 게 없거나 오류가 발생하면 `NULL` 반환
* 반복 호출 시, 한 줄씩 계속 반환
* 마지막 줄에 `\n`이 없으면 포함하지 않음
* 표준 입력(stdin)도 잘 동작해야 함

### 3.4 구현 세부사항

* `read`, `malloc`, `free` 만 사용 가능
* static 변수를 통해 상태 유지
* `BUFFER_SIZE`는 컴파일 시 `-D BUFFER_SIZE=숫자` 로 지정

  * 해당 매크로가 정의되지 않았을 때의 동작도 보장되어야 함
  * 예: `cc -Wall -Wextra -Werror -D BUFFER_SIZE=42 <files>.c`
* `read()` 호출을 최소화하고, 새 줄이 생기면 즉시 반환
* 전체 파일을 미리 읽어서 처리하면 **안 됨**

### 3.5 금지 사항

* `libft` 사용 금지
* `lseek()` 사용 금지
* 전역 변수 사용 금지

---

## 4. 보너스 파트

### 4.1 요구사항

* 오직 하나의 static 변수만 사용할 것
* **여러 개의 파일 디스크립터**를 동시에 처리할 수 있어야 함

  * 예: `fd 3 → fd 4 → fd 5 → fd 3 → fd 4` 순서로 호출해도 각각의 상태를 유지해야 함

### 4.2 제출 파일

* `get_next_line_bonus.c`
* `get_next_line_bonus.h`
* `get_next_line_utils_bonus.c`

---

## 테스트 팁

* `BUFFER_SIZE`, 라인 길이, FD의 특성 등을 다양하게 변경하여 테스트함
  * 다양한 `BUFFER_SIZE`로 테스트 (예: 1, 42, 9999, 10000000 등) 
  * 다양한 길이의 줄을 포함한 파일
  * stdin으로 입력 받아보기
  * 여러 fd로 동시에 읽기 (보너스)
* 메모리 누수 확인

---