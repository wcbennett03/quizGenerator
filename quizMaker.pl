
my $fileName = $ARGV[0];

open(DATA, $fileName) or die "Couldn't open file file.txt, $!";

while(<DATA>){
  #print "$_";

  # define fields into variables
  my @fields = split('\|', $_);

  my $questionNum = $fields[0]; # Question Number
  my $question = $fields[1];    # Actual question
  my @options;                  # Array for the answer options

  for(my $i = 2; $i <= 5; $i++){
    if($fields[$i] ne ""){
      push @options, $fields[$i];
    }
  }

  my $correctAns = $fields[6];  #Correct answer

  my $optionLen = scalar @options;


  print "<fieldset>\n";
  print "<h3><legend>$questionNum) $question</legend></h3>\n";
  print "<ol type = 'a'>\n";

  for(my $k = 0; $k < $optionLen; $k++){
    my $ansOption = $k + 1;
    print "<li>\n";
    print "$options";

    print "<input type=\"Radio\" name=\"Q$questionNum\" id=\"Q$questionNum-A$ansOption\" value=\"$ansOption\" onclick=\"q[$questionNum]=this.value\" alt=\"Option $ansOption of $optionLen\"/>\n";
    print "<span class=\"answers\"><label for=\"Q$questionNum-A$ansOption\">$options[$k]</label></span>\n";
    print "</li>\n";
  }

  print "</ol>\n";
  print "</fieldset>\n";

}
