# This is the reference <TD class=""><A href="http://www.handbook.unsw.edu.au/undergraduate/courses/2016/ACCT2522.html">Management Accounting 1</A></TD>

while(<>){
  if(/<TD class=""><A href="http:\/\/www.handbook.unsw.edu.au\/undergraduate\/courses\/2016\/([A-Z]{4}\d{4}).html">([^\<]+)/i){
    $code = $1;
    $name = $2;
    print "\n$code \t $name\t";
    open F, "wget -q -O- http:\/\/www.handbook.unsw.edu.au\/undergraduate\/courses\/2016\/$code.html |" or die;
    while(<F>){
      if(/<p><strong>Units of Credit:<\/strong>[^\d]*([^\<]+)<\/p>/i){
        $UOC = $1;
        print "$UOC\t";
      }
      if(/<p><strong>School:<\/strong>(\&nbsp\;)*<a href="[^\"]+">([^<]+)/i){
        $faculty = $2;
        print "$faculty\t";
      }
      if (/pre.?(requisite)?(.?:|\s+[A-Z]{4}\d{4})/i){
        s/<[^>]*>/ /g;
        s/EXCLU.*/ /i;
        my @courses = /([A-Z]{4}\d{4})/g;
        print "@courses";
      }
    }
  }
}
