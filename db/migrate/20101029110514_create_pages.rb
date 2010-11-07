class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
       t.references :subject
       # t.integer :subject_id, :null => false, :options => "CONSTRANINT fk_page_subject_id REFERANCE subjects(id)"  
        t.string "name"
        t.string "permalink"
        t.integer "position"
        t.boolean "visible", :default  => false
      t.timestamps
    end
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end

  def self.down
    drop_table :pages
  end
end