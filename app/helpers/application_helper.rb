module ApplicationHelper
   def full_title (title = "")
      baseTitle = "UNSW Degree Tracker"
      if title.empty?
         baseTitle
      else
         "#{title} | #{baseTitle}"
      end
   end

end
