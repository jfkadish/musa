class Work < ActiveRecord::Base
  attr_accessible :work_dated, :notes, :p_image, :title, :photo
  has_attached_file :photo

  def forward
    Work.limit(1).order("id DESC").where("id > ?", id).first
  end

  def back
    Work.limit(1).order("id DESC").where("id < ?", id).first
  end
end
