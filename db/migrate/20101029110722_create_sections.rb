class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
        t.references :page
      #  t.integer :page_id, :null => false, :options => "CONSTRANINT fk_section_pages REFERANCE pages(id)"  
        t.string "name"      
        t.integer "title"
        t.integer "position"
        t.boolean "visible", :default  => false
        t.string "content_type"
        t.text "content"
        t.timestamps
      end
      add_index("sections", "page_id")
  end

  def self.down
    drop_table :sections
  end
end
