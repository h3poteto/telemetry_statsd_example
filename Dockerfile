FROM elixir:1.15.7-otp-25 AS build

ENV MIX_ENV=prod

COPY . /app
WORKDIR /app

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && \
    mix release

FROM erlang:25.3-slim AS app

WORKDIR /app

ENV MIX_ENV=prod
ENV SECRET_KEY_BASE=ITjmevQ4acF4r4NFEINpvMVho70Fh/Kqpj2A69QvJ9qhDgGzu8gOQnnIPWF6X4OI

COPY --from=build /app/_build/prod/rel/example /app

CMD ["/app/bin/example", "start"]
