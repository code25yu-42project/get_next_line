# get_next_line

[日本語](#日本語) | [English](#english) | [한글](#한글)

---

## 日本語

### 概要

`get_next_line` は、ファイルディスクリプタから1行ずつ読み込む C 関数 `get_next_line()` を実装する課題です。複数のファイルディスクリプタを同時に扱うことができ、static 変数の使い方、動的メモリ管理、効率的なバッファ処理が重要になります。

### ファイル構成

```
Makefile
README.md
docs/
  00_requirements.md
includes/
  get_next_line.h
srcs/
  get_next_line.c
  get_next_line_utils.c
```

### 関数仕様

```c
char *get_next_line(int fd);
```

- 改行文字 `\n` を含む1行を読み込んで返します。
- 読み込む行がもうない場合、またはエラーが発生した場合は `NULL` を返します。

### ビルドと実行

```sh
cd srcs
make        # static library(get_next_line.a) を生成
make run    # テストプログラム(get_next_line) を実行
make clean  # ビルド成果物を削除
make fclean # static library とビルド成果物を削除
make re     # static library を再ビルド
```

### テスト

- `BUFFER_SIZE` を変えてテストできます。

  ```sh
  make fclean
  make run CFLAGS="-D BUFFER_SIZE=42"
  ```

- 複数のファイルディスクリプタを同時に読み込むケースにも対応します。

---

## English

### Overview

`get_next_line` is a C project that implements the `get_next_line()` function, which reads input one line at a time from a file descriptor. It can handle multiple file descriptors at the same time, and the key points are static variables, dynamic memory management, and efficient buffering.

### File Structure

```
Makefile
README.md
docs/
  00_requirements.md
includes/
  get_next_line.h
srcs/
  get_next_line.c
  get_next_line_utils.c
```

### Function Description

```c
char *get_next_line(int fd);
```

- Reads and returns one line, including the newline character `\n`.
- Returns `NULL` when there are no more lines to read or when an error occurs.

### Build and Run

```sh
cd srcs
make        # generate the static library (get_next_line.a)
make run    # run the test program (get_next_line)
make clean  # remove build artifacts
make fclean # remove the static library and build artifacts
make re     # rebuild the static library
```

### Testing

- You can test with different `BUFFER_SIZE` values.

  ```sh
  make fclean
  make run CFLAGS="-D BUFFER_SIZE=42"
  ```

- Reading from multiple file descriptors at the same time is also supported.

---

## 한글

### 소개

`get_next_line` 프로젝트는 파일 디스크립터에서 한 줄씩 읽어오는 C 함수 `get_next_line()`을 구현하는 과제입니다. 여러 파일 디스크립터를 동시에 처리할 수 있으며, static 변수의 활용, 동적 메모리 관리, 효율적인 버퍼링이 핵심입니다.

### 파일 구조

```
Makefile
README.md
docs/
  00_requirements.md
includes/
  get_next_line.h
srcs/
  get_next_line.c
  get_next_line_utils.c
```

### 함수 설명

```c
char *get_next_line(int fd);
```

- 줄 끝의 개행 문자 `\n`을 포함한 한 줄을 읽어서 반환합니다.
- 더 이상 읽을 줄이 없거나 오류가 발생하면 `NULL`을 반환합니다.

### 빌드 및 실행

```sh
cd srcs
make        # 정적 라이브러리(get_next_line.a) 생성
make run    # 테스트 프로그램(get_next_line) 실행
make clean  # 빌드 산출물 삭제
make fclean # 정적 라이브러리 및 빌드 산출물 삭제
make re     # 정적 라이브러리 재빌드
```

### 테스트

- 다양한 `BUFFER_SIZE`로 테스트할 수 있습니다.

  ```sh
  make fclean
  make run CFLAGS="-D BUFFER_SIZE=42"
  ```

- 여러 개의 파일 디스크립터를 동시에 읽는 것도 지원합니다.