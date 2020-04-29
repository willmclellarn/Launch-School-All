# numbers = [7, 3, 5, 2, 1, 8, 4]
# counter = 0

# loop do
#   number = numbers[counter]
#   # number = 7
#   counter = 0
#   # counter = 0 

#   loop do
#     counter += 1
#     puts counter

#     break if counter >= number
#   end

#   counter += 1
#   break if counter >= numbers.size
# end

# def snake(str)
#   words = str.split
#   current_word = 0

#   loop do
#     words[current_word].downcase!

#     current_word += 1
#     break if current_word >= words.size
#   end

#   words.join('_')
# end

# sentence = 'The sky was blue'
# puts snake(sentence) # => 'the_sky_was_blue'

mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]
counter = 0

loop do
  break if counter == mailing_campaign_leads.size
  full_name = mailing_campaign_leads[counter][:name]
  names = full_name.split
#creating array of [first_name, last_name]

  names_counter = 0
  loop do
    break if names_counter == names.size
    name = names[names_counter]
    names[names_counter] = name.capitalize
    names_counter += 1
  end
  #capitalizing first and last name

  capitalized_full_name = names.join(' ')
  mailing_campaign_leads[counter][:name] = capitalized_full_name
  #re-assigning new properly capitalized string back into the OG array
  counter += 1
  #circling back to next person
end

usable_leads = []
counter = 0

loop do
  break if counter == mailing_campaign_leads.size
  last_login = mailing_campaign_leads[counter][:days_since_login]
  subscribed_to_list = mailing_campaign_leads[counter][:mailing_list]
#local variables for this person's last login day and boolean subscribed or not
  if last_login < 60 && subscribed_to_list
    usable_leads << mailing_campaign_leads[counter]
  end
# if this person meets criteria, add them to a new list
  counter += 1
# go to the next person
end