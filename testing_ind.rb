def calculate_score(hand)
  total_value=0
  ace_counter=0
  #Goes through the whole hand (hash). Adds the value of the cards with mumbers, adds +10 for Jacks,Queens and Kings
  #It does not add the values of aces yet but keep track of how many there are in hand.
  hand.each do |k,values|
    values.each do |value|
      if value=="Jack"|| value=="Queen" || value=="King"
        total_value+=10
      elsif value.class==Fixnum
        total_value+=value
      else
        ace_counter+=1
      end
    end   
  end
  # Aces value are estimated after adding the other cards with fixed value. 
  # Aces value are set to 1 or 11 depending on what's more convinient for the player. 
  while ace_counter>0
    if total_value+11<=21 
      total_value+=11
    else
      total_value+=1
    end
    ace_counter-=1
  end
  
  total_value
end