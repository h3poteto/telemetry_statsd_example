FROM elixir:1.15.7-otp-25

ENV MIX_ENV=prod
ENV SECRET_KEY_BASE=ITjmevQ4acF4r4NFEINpvMVho70Fh/Kqpj2A69QvJ9qhDgGzu8gOQnnIPWF6X4OI

COPY . /app
WORKDIR /app

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && \
    mix release

CMD ["/app/_build/prod/rel/example/bin/example", "start"]
