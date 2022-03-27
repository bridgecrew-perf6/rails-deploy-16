# config valid for current version and patch releases of Capistrano
lock "~> 3.17.0"

# アプリケーション名
set :application, "rails-deploy"
# リモートリポジトリ名（デプロイ対象）
set :repo_url, "git@github.com:sakataku1991/rails-deploy.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
# デプロイするブランチ
set :branch, "main"

# Default deploy_to directory is /var/www/my_app_name
# デプロイ先のパス
set :deploy_to, "/home/webapp/#{fetch(:application)}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# ファイルのシンボリックリンクの作成
# ※「shared」ディレクトリ配下で管理したいファイルの名前を記載（そのファイルがすでに「shared」ディレクトリ内に置かれていることが前提）
append :linked_files, ".env"

# Default value for linked_dirs is []
# ディレクトリのシンボリックリンクの作成
# ※「shared」ディレクトリ配下で管理したいディレクトリの名前を記載（そのディレクトリがすでに「shared」ディレクトリ内に置かれていることが前提）
append :linked_dirs, "log", "tmp/cache", "tmp/pids", "tmp/sockets"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# デプロイしたアプリを何世代まで残すかの設定
# ※今回は5世代分を保存する
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"

set :puma_threads, [0, 5]
set :puma_workers, 2
