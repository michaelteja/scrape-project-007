require 'Nokogiri'
require 'open-uri'
# require_relative 'scraper.rb'

def students_profile (students_array)
    students_array.each do |student_hash|
    new_student = Student.new(student_hash[:name], student_hash[:education], student_hash[:bio], student_hash[:work])
  end 
end 



class Student
    @@all = []
    attr_accessor :name, :education, :bio, :work  

    def initialize(name, education, bio, work)
        @name = name
        @education = education
        @bio = bio
        @work = work
    
        @@all << self
    end

    def self.find_student_by_name(search_name)
        answer = nil
        @@all.each do |student|
          if student.name == search_name
            answer = student
          end
        end 
      puts answer.name
      puts answer.education
      puts answer.bio
      puts answer.work 
    end

    def self.all
        @@all 
    end 


end


def run
  students_array = [{:name=>"Ian Candy", :education=>"B.S. in Economics, 2007  The Pennsylvania State University", :bio=>"Ian Candy is a 29 year old living in New York. He previously worked in Blue School as Technology Coordinator, where he managed and trained faculty and students on schoolwide Technology.  Prior, he interned with The Moth, where he edited video content that appeared on the acclaimed storytelling organization's YouTube channel. Ian holds a B.S. in Economics from Penn State University, where he was a head writer for Phroth, the campus humor magazine. A western Pennsylvania native, he enjoys rooting for the Steelers and speaking Pittsburghese.", :work=>"Blue SchoolTechnology Coordinator - managed IT and taught \"Intro to Coding\" course for Kindergarten-5th Grade."}, {:name=>"Kevin Character", :education=>"BA Journalism and Communications University of Georgia ", :bio=>"I'm a transplant from Atlanta who moved to NY in 2011. I love museums, a good glass of wine and college football Saturdays!", :work=>"Sales Training and Development"}, {:name=>"Sopie DeBenedetto", :education=>"BA from Bardnard College, 2011", :bio=>"Graduatated from Barnard College in 2011. Lives in Brooklyn currently. Spent the past few years teaching and tutoring. Spends free time at the Lower East Side Workers Center.", :work=>""}, {:name=>"Rebecca Eakins", :education=>"Williams CollegeUW Madison", :bio=>"Rebecca grew up riding horses all across Wisconsin's beautiful Midwestern prairies, then came back east for the whole liberal arts thing at Williams College. After school, she moved to NYC to get involved in Silicon Alley. Now, she's reclaiming her sense of adventure through code.", :work=>"Coming Soon.."}, {:name=>"Eric Fries", :education=>"CUNY School of LawCollege of Charleston", :bio=>"I'm a half web developer / half IP lawyer base in Broolyn, NY.", :work=>"Internet/Intellectual Property Attorney"}, {:name=>"Jay Jacobs", :education=>"University of Miami", :bio=>"Jason has been never been one for making permanent decisions. He first started in the finance world at Merrill Lynch then made a switch into the food industry working with an Iron Chef and handling his marketing team. After that, Jason made some awesome educational apps for kids with MarcoPolo Learning. You can usually find him trying new food somewhere or coming up with new company ideas.", :work=>"MarcoPolo Learning makes award-winning interactive educational apps for kids."}, {:name=>"Casie Levine", :education=>"University of Florida, Bachelors and Masters in Accounting", :bio=>"NYC by way of South Florida", :work=>"Big 4 Accounting/Hedge Fund"}, {:name=>"John \"Jack\" Gaybrick", :education=>"The Wharton School '16University fo Pennsylvania  '16St. Albans School for Boys '11", :bio=>"I grew up in Washington DC and am the youngest of four brothers.  I am a current student at the University of Pennsylvania pursuing degrees in Finance and Chinese history.  When I was 15, my parents and I moved to Beijing where my father helped facilitate the opening of a new office at his law firm.  I lived in Beijing for one year where I studied Mandarin and traveled around the country.  Apart from Beijing and until moving to Philadelphia for school, I lived in Washington my entire life and harbor great affection for the city and surrounding areas.  My interests include sports of all kinds, technology, fitness and nutrition, as well as music and entertainment.", :work=>"Blurb about company..."}, {:name=>"Cyrus Ghazanfar", :education=>"Pace University", :bio=>"Cyrus has been living in NYC for the past 4 years and loves it. He was born in London, grew up in Paris, France, lived in Tunisia and now the U.S.A. He likes math, learning new things and solving problems using technology.", :work=>"Cyrus recently graduated from Pace University with a degree in Economics and a concentration in statistical economics."}, {:name=>"Alex Goldvarg", :education=>"Lehigh University", :bio=>"Making moves.", :work=>"Coming Soon.."}, {:name=>"Laura Hines", :education=>"Syracuse University 2006. BA Art History, BA Philosophy, Minor in Writing", :bio=>"Laura Hines was Manager of Public Programs at the Museum of the City of New York and the South Street Seaport Museum. She lives with her husband on the upper east side and in her free time enjoys cooking and traveling.", :work=>""}, {:name=>"Maureen Johnston", :education=>"UniversityOther School", :bio=>"New Yorker.  Programmer.", :work=>"Some CompanyBlurb about company..."}, {:name=>"Alex Lee", :education=>"University of California, San Diego (UCSD)", :bio=>"The past three years, I used my mechanical engineering degree to work in the semiconductor industry.  In my free time I love to go hiking, workout, and watch UFC.  I found room to include coding as part of my hobby during my free time but never pursued any further than that.  I finally decided to take the leap of faith and change my hobby into a passion/career.  Flatiron school is the first step to my journey… let the adventures begin!", :work=>"SAS - Engineer II"}, {:name=>"Chloe Lee", :education=>"Occidental CollegeUniversity of East Anglia", :bio=>"Chloe hails from Boston, where she grew up enjoying her chowder. After studying urban policy in college, she made her way to the Big Apple to people watch and contribute to the DoSomething.org team. Now, she wrangles code!!", :work=>"DoSomething.org makes the world suck less. One of the largest orgs for young people and social change, our 3.3 million members tackle campaigns that impact every cause, from poverty to violence to the environment to literally everything else."}, {:name=>"Andrew Miksch", :education=>"University of Alaska, Anchorage - BA in Economics", :bio=>"I grew up in Eagle River, Alaska. I moved to NYC in 2009. I love playing sports and make things.", :work=>""}, {:name=>"Rachel Nackman", :education=>"BA in Art History & English, Tufts UniversityMA in Art History, Institute of Fine Arts, New York University", :bio=>"After 7+ years as the curator of a private art collection, I’m learning to code. Passionate about artists, museums, and the technology that supports them.", :work=>"Notations Exhibition\n                    Art=Text=Art"}, {:name=>"Seiji Naganuma", :education=>"B.S. Material Science & Engineering, UCLA 2010", :bio=>"Hi there! I’m Seiji — an Angeleno recently transplanted to New York City. I worked as a Business Intelligence consultant with primary focus on corporate performance management. I was inspired to learn how to build beautiful websites and now I’m at the Flatiron School!\n                  Outside of learning about the latest and greatest web development techniques and trends, my interests include staying physically active (running, tennis, yoga), traveling, music (anything from classical, country, to electronic), eating good food, and reading.", :work=>"Business Intelligence Consultant"}, {:name=>"Skylar Panuska", :education=>"MSW from Hunter College School of Social Work, 2010BA from New York University, 2006", :bio=>"I'm a cornfed midwestern girl at heart and have loved living in NYC for 12 years. I am passionate about preventing sexual assault and promoting healing for survivors. I love learning, cooking, eating, yoga, and...you?", :work=>""}, {:name=>"Jennifer Sardina", :education=>" Stony Brook University || BA Italian Studies", :bio=>"I grew up in a farm in the Dominican Republic and returned to the States at the age of 13.  Growing up as the fifth child in seven siblings, I learned to share and work well with others, and value individual talents.  Before Flatiron School, I was a Health Coach at a women's health and wellness program in Jackson Heights.  Before that, I had an extensive experience in education and customer service.  I enjoy running in nice weather, bike-riding and having great vegan food!  My favorite things in the world are learning, internet and ballroom dancing.  Actually -- there are many more things that I love, but let's leave it at that for now.  I am also a songwriter, and am extremely talkative.  Random fact: I can bend my thumb backwards to a 90-degree angle.", :work=>""}, {:name=>"Rebecca Shapiro", :education=>"University: Northwestern UniversityOther School: The Flatiron School", :bio=>"Rebecca grew up in Westchester, went to school in Chicago where she studied Communication, and has been living in NYC for 4 years. She loves camping, knitting, puzzles, skiing, and live music", :work=>"Rebecca started in TV ratings research, moved to fashion, buying for Amazon for a few years, and most recently worked as a Functional Analyst on a web development team at a digital agency."}, {:name=>"Jeremy Sklarsky", :education=>"BA in History, Rutgers UniversityMasters in Music Technology from NYU", :bio=>"I’m a recovering music producer and audio engineer. I've worked in recording studios, worked with a music based non-profit, and spent a year in the audio department of Saturday Night Live.  I’m from New Jersey originally, but now live in Ft. Greene, Brooklyn with my wife. I like to cook, listen to standup and watch Seinfeld reruns.", :work=>"Freelance music producer"}, {:name=>"Holden Steinberg", :education=>"University of Pennsylvania, Wharton", :bio=>"iBanker turned UX, Designer turned Front-End Dev, Turned Startup Co-founder", :work=>"Creative director"}, {:name=>"Matthew Stines", :education=>"BA in Music Business, Berklee College of Music", :bio=>"I have 10 years of experience in the music business—preforming and in the record industry. I have 20 years experience as a guitarist. I went to Berkley College of music in Boston and I’ve been in NYC for 10 years, working largely in the record business.", :work=>"Marketing associate."}, {:name=>"Michael Tejada", :education=>"Stanford UniversityOther School", :bio=>"Built in Phoenix, Arizona. Stanford educated. New York City transplant. Former Teacher. Current Rubyist.", :work=>"Teach for America"}, {:name=>"Kate Travers", :education=>"University of Illinois, Urbana-ChampaignIndiana University, Bloomington", :bio=>"Proud Midwest ex-pat.", :work=>"Coming Soon.."}, {:name=>"Deniz Unat", :education=>"Vocational Training as IT Systems Assistant in Germany", :bio=>"I was born to a Turkish Family in Germany. I lived there my whole life, until I got married and moved to the States in 2007.", :work=>"3 years as IT Systems Assistant at Deutsche Telekom AG"}, {:name=>"Ville Vesterninen", :education=>"Helsinki School of EconomicsLondon School of Economics", :bio=>"My name is Ville. I'm originally from Helsinki, Finland but I currently live in Brooklyn. I have worked with technology several years, but have never had the opportunity to take the time and focus to learn programming ground up. Now I do and Flatiron School is clearly the best place to do just that.", :work=>"Recovering CEO"}, {:name=>"Dan Visintainer", :education=>"SUNY Oneonta, B.S. in Computer Science", :bio=>"Aspiring coder, jazz musician, and amateur photographer. I think at least one of those is interesting.", :work=>"Right Click Solutions\n                Network & Support Engineer"}, {:name=>"Bethanne Zink", :education=>"University of Virginia", :bio=>"Former behavior therapist for children and young adults with autism in Charlottesville, VA. New New Yorker whose most prized possession is her New York Public Libary card. Frequent walker and traveler and karaoke-singer.", :work=>"Did behavior-related things."}]
    students_profile (students_array)
    puts "Welcome to The Flatiron School! Please enter a student's name..."
    user_command = gets.chomp
      Student.find_student_by_name(user_command) 
end
run