sub  trim
{
	my $s = shift;
	$s =~ s/^\s+|\s+$//g;
	return $s
};
print "-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x\n";
print "													Yahtzee\n\n";
print "-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x\n";
print "												Enter the name of player 1 : ";
my $player1=<>;
$player1=trim($player1) ;
print "\n";
print "												Enter the name of player 2 : ";
my $player2=<>;
$player2=trim($player2) ;
print "\n";
my @matrix;
for(my $i=0;$i<14;$i++)
{
	for(my $j=0;$j<2;$j++)
	{
		$matrix[$i][$j]=0;
	}
}
my @categories=("Ones           ","Twos           ","Threes         ","Fours          ","Fives          ","Sixes          ","Bonus          ","Three of a kind","Four of a kind ","Full house     ","Small straight ","Large straight ","Chance         ","Yahtzee        ");
my @throw;
my @retain;
my @selected1;
for(my $i=0;$i<13;$i++)
{
	$selected1[$i]=0;
}
my @selected2;
for(my $i=0;$i<13;$i++)
{
	$selected2[$i]=0;
}
for(my $k=0;$k<14;$k++)
{
	for(my $l=0;$l<2;$l++)
	{
		$matrix[$k][$l]=0;
	}
}
OUTER:
for(my $i=0;$i<26;$i++)
{
	for(my $i=0;$i<5;$i++)
	{
		$retain[$i]=0;
	}
	my $message;
	if($i%2==0)
	{
		$message="\n													$player1\'s turn\n\n";
	}
	else
	{
		$message="\n													$player2\'s turn\n\n";
	}
	print "-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x\n";
	print "$message";
	print "\n";
	my @count;
	my $val=0;
	do
	{
		print "-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x\n";
		for(my $k=0;$k<14;$k++)
		{
			for(my $l=0;$l<2;$l++)
			{
				if(($selected1[$k]==0)&&($l==0))
				{
					$matrix[$k][$l]=0;
				}
				if(($selected2[$k]==0)&&($l==1))
				{
					$matrix[$k][$l]=0;
				}
			}
		}
		print "												Current throw : ";
		for(my $k=0;$k<5;$k++)
		{
			if($retain[$k]==0)
			{
				$throw[$k]=1+int(rand(6));
			}
			print "$throw[$k] ";
		}
		print "\n\n";
		my $sum=0;
		for(my $k=0;$k<5;$k++)
		{
			$sum=$sum+$throw[$k];
		}
		print "\n";
		for(my $k=0;$k<6;$k++)
		{
			$count[$k]=0;
		}
		for(my $k=0;$k<5;$k++)
		{
			if($throw[$k]==1)
			{
				$count[0]++;
			}
			else
			{
				if($throw[$k]==2)
				{
					$count[1]++;
				}
				else
				{
					if($throw[$k]==3)
					{
						$count[2]++;
					}
					else
					{
						if($throw[$k]==4)
						{
							$count[3]++;
						}
						else
						{
							if($throw[$k]==5)
							{
								$count[4]++;
							}
							else
							{
								$count[5]++;
							}
						}
					}
				}
			}
		}
		for(my $k=0;$k<6;$k++)
		{
			if($i%2==0)
			{
				if($selected1[$k]==0)
				{
					$matrix[$k][0]=$count[$k]*($k+1);
				}
			}
			else
			{
				if($selected2[$k]==0)
				{
					$matrix[$k][1]=$count[$k]*($k+1);
				}
			}
		}
		if($i%2==0)
		{
			for(my $k=0;$k<6;$k++)
			{
				if($count[$k]>=3)
				{
					if($selected1[7]==0)
					{
						$matrix[7][0]=$sum;
					}
				}
			}
			for(my $k=0;$k<6;$k++)
			{
				if($count[$k]>=4)
				{
					if($selected1[8]==0)
					{
						$matrix[8][0]=$sum;
					}
				}
			}
			for(my $k=0;$k<6;$k++)
			{
				if($count[$k]==3)
				{
					for(my $l=0;$l<6;$l++)
					{
						if($count[$l]==2)
						{
							if($selected1[9]==0)
							{
								$matrix[9][0]=25;
							}
						}
					}
				}
			}
			for(my $k=0;$k<6;$k++)
			{
				if($count[$k]==5)
				{
					if($selected1[13]==0)
					{
						$matrix[13][0]=50;
					}
				}
			}
			if($selected1[12]==0)
			{
				$matrix[12][0]=$sum;
			}
			if($selected1[11]==0)
			{
				if((($count[0]==1)&&($count[1]==1)&&($count[2]==1)&&($count[3]==1)&&($count[4]==1))||(($count[5]==1)&&($count[1]==1)&&($count[2]==1)&&($count[3]==1)&&($count[4]==1)))
				{
					$matrix[11][0]=40;
				}
			}
			if($selected1[10]==0)
			{
				if((($count[0]>=1)&&($count[1]>=1)&&($count[2]>=1)&&($count[3]>=1))||(($count[4]>=1)&&($count[1]>=1)&&($count[2]>=1)&&($count[3]>=1))||(($count[4]>=1)&&($count[5]>=1)&&($count[2]>=1)&&($count[3]>=1)))
				{
					$matrix[10][0]=30;
				}
			}
		}
		else
		{
			for(my $k=0;$k<6;$k++)
			{
				if($count[$k]>=3)
				{
					if($selected2[7]==0)
					{
						$matrix[7][1]=$sum;
					}
				}
			}
			for(my $k=0;$k<6;$k++)
			{
				if($count[$k]>=4)
				{
					if($selected2[8]==0)
					{
						$matrix[8][1]=$sum;
					}
				}
			}
			for(my $k=0;$k<6;$k++)
			{
				if($count[$k]==3)
				{
					for(my $l=0;$l<6;$l++)
					{
						if($count[$l]==2)
						{
							if($selected2[9]==0)
							{
								$matrix[9][1]=25;
							}
						}
					}
				}
			}
			for(my $k=0;$k<6;$k++)
			{
				if($count[$k]==5)
				{
					if($selected2[13]==0)
					{
						$matrix[13][1]=50;
					}
				}
			}
			if($selected2[12]==0)
			{
				$matrix[12][1]=$sum;
			}
			if($selected2[11]==0)
			{
				if((($count[0]==1)&&($count[1]==1)&&($count[2]==1)&&($count[3]==1)&&($count[4]==1))||(($count[5]==1)&&($count[1]==1)&&($count[2]==1)&&($count[3]==1)&&($count[4]==1)))
				{
					$matrix[11][1]=40;
				}
			}
			if($selected2[10]==0)
			{
				if((($count[0]>=1)&&($count[1]>=1)&&($count[2]>=1)&&($count[3]>=1))||(($count[4]>=1)&&($count[1]>=1)&&($count[2]>=1)&&($count[3]>=1))||(($count[4]>=1)&&($count[5]>=1)&&($count[2]>=1)&&($count[3]>=1)))
				{
					$matrix[10][1]=30;
				}
			}
		}
		print "\t\t\t\t\t\t\t\t\t\t\t\t\t\t   $player1   $player2\n\n";
		for(my $k=0;$k<14;$k++)
		{
			my $index=$k+1;
			if($index<10)
			{
				print "												0$index $categories[$k] ";
			}
			else
			{
				print "												$index $categories[$k] ";
			}
			for(my $l=0;$l<2;$l++)
			{
				if($matrix[$k][$l]<10)
				{
					print "0"
				}
				print "$matrix[$k][$l]    ";
			}
			print "\n\n";
		}
		print "\n";
		if($val==2)
		{
			print "												Choose a category : ";
			my $string=<>;
			$string=trim($string);
			if($i%2==0)
			{
				$selected1[$string-1]=1;
			}
			else
			{
				$selected2[$string-1]=1;
			}
			for(my $k=0;$k<14;$k++)
			{
				if($i%2==0)
				{
					if($selected1[$k]==0)
					{
						$matrix[$k][0]=0;
					}
					if($k==$string-1)
					{
						$matrix[$k][0]=$matrix[$k][0]."(d)";
					}
				}
				else
				{
					if($selected2[$k]==0)
					{
						$matrix[$k][1]=0;
					}
					if($k==$string-1)
					{
						$matrix[$k][1]=$matrix[$k][1]."(d)";
					}
				}
			}
			next OUTER;
		}
		print "												Do you want to roll the dices again : ";
		my $choice=<>;
		$choice=trim($choice);
		if($choice eq "yes")
		{
			print "												Enter the number of dices you want to retain : ";
			my $num=<>;
			$num=trim($num);
			for(my $k=0;$k<5;$k++)
			{
				$retain[$k]=0;
			}
			if($num>0)
			{
				print "												Enter the dices to be retained  : ";
			}
			for(my $k=0;$k<$num;$k++)
			{
				my $input=<>;
				$input=trim($input);
				$retain[$input-1]=$throw[$input-1];
				print "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  ";
			}
			print "\n";
		}
		else
		{
			print "												Choose a category : ";
			my $string=<>;
			$string=trim($string);
			if($i%2==0)
			{
				$selected1[$string-1]=1;
			}
			else
			{
				$selected2[$string-1]=1;
			}
			for(my $k=0;$k<14;$k++)
			{
				if($i%2==0)
				{
					if($selected1[$k]==0)
					{
						$matrix[$k][0]=0;
					}
					if($k==$string-1)
					{
						$matrix[$k][0]=$matrix[$k][0]."(d)";
					}
				}
				else
				{
					if($selected2[$k]==0)
					{
						$matrix[$k][1]=0;
					}
					if($k==$string-1)
					{
						$matrix[$k][1]=$matrix[$k][1]."(d)";
					}
				}
			}
			next OUTER;
		}
		$val++;
	}while($val<3);
}
for(my $i=0;$i<14;$i++)
{
	if($i!=6)
	{
		if($matrix[$i][0]<10)
		{
			$matrix[$i][0]=substr($matrix[$i][0],0,1);
		}
		else
		{
			$matrix[$i][0]=substr($matrix[$i][0],0,2);
		}
		if($matrix[$i][1]<10)
		{
			$matrix[$i][1]=substr($matrix[$i][1],0,1);
		}
		else
		{
			$matrix[$i][1]=substr($matrix[$i][1],0,2);
		}
	}
}
$sum61=0;
$sum62=0;
for(my $i=0;$i<6;$i++)
{
	$sum61=$sum61+$matrix[$i][0];
	$sum62=$sum62+$matrix[$i][1];
}
if($sum61>=63)
{
	$matrix[6][0]=35;
}
if($sum62>=63)
{
	$matrix[6][1]=35;
}
$sum1=0;
$sum2=0;
print "\n\n\n\n";
print "-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x\n";
print "													Final Scorecard\n\n";
print "-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x\n";
for(my $k=0;$k<14;$k++)
{
	print "												$categories[$k] ";
	$sum1=$sum1+$matrix[$k][0];
	$sum2=$sum2+$matrix[$k][1];
	for(my $l=0;$l<2;$l++)
	{
		if($matrix[$k][$l]<10)
		{
			print "0";
		}
		print "$matrix[$k][$l]    ";
	}
	print "\n\n";
}
print "-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x\n";
print "\n";
print "\t\t\t\t\t\t\t\t\t\t\t\t$player1 : $sum1";
print "    $player2 : $sum2\n\n";
print "-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x\n";
print "\n\n";
if($sum1>$sum2)
{
	print "\t\t\t\t\t\t\t\t\t\t\t\t\t$player1 wins\n\n\n";
}
else
{
	if($sum2>$sum1)
	{
		print "\t\t\t\t\t\t\t\t\t\t\t\t\t$player2 wins\n\n\n";
	}
	else
	{
		print "\t\t\t\t\t\t\t\t\t\t\t\t\tIt's a tie\n\n\n";
	}
}
print "-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x\n";
