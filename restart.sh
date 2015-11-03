#!/usr/bin/env bash

export RAILS_ENV="production"
export SECRET_KEY_BASE="dc655e51fbceaff400e647d0f807e0ca6b7baf64e7ca5fb667bc7b4d87b5b52abe27fe1a8d5ff60d2812c45e231274439413ac1cfef35a4ffdb5e8db99ca9d84"

export AWS_ACCESS_KEY_ID="AKIAIVI264JAL6VLZWDA"
export AWS_BUCKET="anfshift"
export AWS_SECRET_ACCESS_KEY="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"

echo "Db migrate"
rake db:migrate

echo "Assets precompile"
rake assets:precompile

echo "Restart server"
pumactl -F config/puma.rb stop
pumactl -F config/puma.rb start
