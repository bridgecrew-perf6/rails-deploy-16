# Pumaの設定ファイル

# スレッドの数
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Railsを起動するport番号の指定
port        ENV.fetch("PORT") { 3000 }

# Pumaが起動する実行環境の指定
environment ENV.fetch("RAILS_ENV") { ENV['RACK_ENV'] || "production" }

# pid（Process ID）。Pumaが起動した際の処理番号。
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# ワーカーの数
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# アプリの事前ロード
preload_app!

# Pumaへのプラグインの追加
plugin :tmp_restart

# アプリのルートを指定している？
# 見た感じ相対パスの指定先も「rails-deploy」ディレクトリのところなので、どこがルートかを定義しているっぽい
app_root = File.expand_path("../..", __FILE__)

# UNIXドメインソケット
# PumaとNginxを通信させるのに必要な設定っぽい
bind "unix:#{app_root}/tmp/sockets/puma.sock"
