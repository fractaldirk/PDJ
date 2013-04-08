module AdminHelper
  def weekago
    week = Song.find(:all, :conditions => ["created_at > ?", 1.week.ago]).count.to_i
    bweek = Song.find(:all, :conditions => ["created_at > ?", 6.days.ago]).count.to_i
    week - bweek
  end
end
