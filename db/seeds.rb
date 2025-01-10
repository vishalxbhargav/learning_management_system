# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Seed data for course categories with parent-child relationships
categories = [
  { name: "Business and Management", subcategories: [
      "Leadership and Management",
      "Project Management",
      "Entrepreneurship",
      "Human Resources",
      "Marketing and Sales",
      "Finance and Accounting",
      "Business Communication",
      "Customer Service",
      "Business Analytics"
    ] 
  },
  { name: "Technology and IT", subcategories: [
      "Software Development",
      "Cybersecurity",
      "Data Science and Analytics",
      "Cloud Computing",
      "Artificial Intelligence and Machine Learning",
      "Web Development",
      "Mobile App Development",
      "IT Support and Networking",
      "DevOps"
    ] 
  },
  { name: "Creative Arts and Design", subcategories: [
      "Graphic Design",
      "Photography",
      "Video Production and Editing",
      "Interior Design",
      "Fashion Design",
      "Music and Audio Production",
      "Animation and VFX",
      "Fine Arts",
      "Writing and Storytelling"
    ] 
  },
  # Add more parent categories and their subcategories here...
]

# Create parent and child categories
categories.each do |category_data|
  parent = CourseCategory.find_or_create_by(name: category_data[:name])
  category_data[:subcategories].each do |subcategory_name|
    CourseCategory.find_or_create_by(name: subcategory_name, parent: parent)
  end
end

puts "Seeded #{CourseCategory.count} course categories with parent-child relationships."
