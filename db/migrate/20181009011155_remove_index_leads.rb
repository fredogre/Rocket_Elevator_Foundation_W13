class RemoveIndexLeads < ActiveRecord::Migration[5.2]
  def change
    remove_index "leads", name:"index_leads_on_Email"
  end
end
