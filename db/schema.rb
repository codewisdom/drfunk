# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090902185334) do

  create_table "features", :force => true do |t|
    t.string   "name"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "features", ["plan_id"], :name => "index_features_on_plan_id"

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scenarios", :force => true do |t|
    t.string   "name"
    t.text     "setup"
    t.integer  "plan_id"
    t.integer  "feature_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "requirement"
    t.string   "result"
  end

  add_index "scenarios", ["feature_id"], :name => "index_scenarios_on_feature_id"
  add_index "scenarios", ["plan_id"], :name => "index_scenarios_on_plan_id"

  create_table "steps", :force => true do |t|
    t.text     "description"
    t.text     "expected"
    t.integer  "scenario_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "steps", ["scenario_id"], :name => "index_steps_on_scenario_id"

end
