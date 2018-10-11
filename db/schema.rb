# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
    t.integer "user_id"
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_10_141037) do
=======
ActiveRecord::Schema.define(version: 2018_10_10_215853) do
>>>>>>> master

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Type"
    t.string "Status"
    t.string "Entity"
    t.string "Street"
    t.string "Suite"
    t.string "City"
    t.string "PostalCode"
    t.string "Country"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "Building_id"
    t.string "Type"
    t.bigint "Employee_id"
    t.date "Startup_Date"
    t.date "Last_Inspection_Date"
    t.binary "Operation_Certificate"
    t.text "Information"
    t.text "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Status"
    t.index ["Building_id"], name: "index_batteries_on_Building_id"
    t.index ["Employee_id"], name: "index_batteries_on_Employee_id"
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "Building_id"
    t.string "Information_Key"
    t.string "Value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Building_id"], name: "index_building_details_on_Building_id"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "address_id"
    t.string "Administrator_Name"
    t.string "Administrator_Email"
    t.string "Administrator_Phone"
    t.string "Technician_Name"
    t.string "Technician_Email"
    t.string "Technician_Phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_buildings_on_address_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "Battery_id"
    t.string "Type"
    t.integer "Number_Of_Floors"
    t.string "Status"
    t.text "Information"
    t.text "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Battery_id"], name: "index_columns_on_Battery_id"
  end

  create_table "contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "First_Name"
    t.string "Last_Name"
    t.string "Project_Name"
    t.string "Location"
    t.string "Company"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "Company"
    t.bigint "address_id"
    t.string "Contact_Name"
    t.string "Contact_Phone"
    t.string "Contact_Email"
    t.text "Company_Description"
    t.string "Service_Tech_Name"
    t.string "Service_Tech_Phone"
    t.string "Service_Tech_Email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_customers_on_address_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "Column_id"
    t.string "Serial_Number"
    t.string "Model"
    t.string "Type"
    t.string "Status"
    t.date "Startup_Date"
    t.date "Last_Inspection_Date"
    t.binary "Inspection_Certificate"
    t.text "Information"
    t.text "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Column_id"], name: "index_elevators_on_Column_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Last_Name"
    t.string "First_Name"
    t.string "Function"
    t.string "Email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Full_Name"
    t.string "Company"
    t.string "Email"
    t.string "Phone_Number"
    t.string "Project_Name"
    t.string "Project_Description"
    t.string "Elevators_Department"
    t.text "Message"
    t.binary "Attached_File"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attached_file_file_name"
    t.string "attached_file_content_type"
    t.integer "attached_file_file_size"
    t.datetime "attached_file_updated_at"
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "nb_of_units"
    t.integer "nb_of_floors"
    t.integer "nb_of_basements"
    t.integer "nb_of_parkings"
    t.integer "nb_of_elevators"
    t.integer "max_occupants"
    t.integer "business_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Project_Type"
    t.string "product_type"
    t.integer "contact_id"
    t.integer "unitcost"
    t.integer "installcost"
    t.integer "totalcost"
    t.integer "nbshaft"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "batteries", "buildings", column: "Building_id"
  add_foreign_key "batteries", "employees", column: "Employee_id"
  add_foreign_key "building_details", "buildings", column: "Building_id"
  add_foreign_key "buildings", "addresses"
  add_foreign_key "buildings", "customers"
  add_foreign_key "columns", "batteries", column: "Battery_id"
  add_foreign_key "customers", "addresses"
  add_foreign_key "customers", "users"
  add_foreign_key "elevators", "columns", column: "Column_id"
end
