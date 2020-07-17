FROM python:3-slim AS builder
COPY . /app
WORKDIR /app

# We are installing a dependency here directly into our app source dir
RUN pip install --target=/app github3.py==1.3.0 cffi==1.14.0

# A distroless container image with Python and some basics like SSL certificates
# https://github.com/GoogleContainerTools/distroless
# distroless brakes cypto cffi
# FROM gcr.io/distroless/python3-debian10
# COPY --from=builder /app /app
WORKDIR /app
ENV PYTHONPATH /app
CMD ["/app/main.py"]
