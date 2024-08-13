# Rust 공식 이미지 사용
FROM rust:latest

# 작업 디렉토리 설정
WORKDIR /usr/src/myapp

# Cargo.toml과 Cargo.lock을 먼저 복사하여 의존성 캐시 활용
COPY Cargo.toml Cargo.lock ./

# 의존성 설치
RUN cargo build --release
RUN rm src/*.rs

# 소스 코드 복사
COPY . .

# 기본 명령어 설정
CMD ["cargo", "run"]
