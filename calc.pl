#!C:/perl/bin/perl.exe

use warnings;
#use diagnostics;
use Tk;
use Tk::ProgressBar::Mac;
use Tk::Splashscreen;
use POSIX;

use strict;


our ($mw,$warning);
our $outputfield;
&do_Toplevel;
our ($warned,$ver);
sub do_Toplevel {
            $warning = MainWindow->new(-takefocus=>1);
		$warning->geometry("200x100");
		$warning->withdraw;
			$warning->update;
        $warning->protocol( 'WM_DELETE_WINDOW' => sub { } )
          ;    #prevent WM close button working
        $warning->title("Copyright");
		my $warnlabel = $warning->Label(-text=> "This is a standardized Copyright warning.", -wrap=> 150)->pack(-anchor=>'n');
		my $warnlabel2= $warning->Label(
		-text=> "Do not redistribute this application without permission from it's maker.", -wrap=> 150)->pack(-anchor=>'n');
		
        $warned=$warning->Button(
            -text    => "Close",
            -command => sub { 
			$warning->destroy;
			$mw->Popup },
        )->pack;
    &mainwindow;
	}
sub mainwindow{
$mw = MainWindow->new;
$mw->geometry("400x250");
$mw->title("Dofus Profession Calculator");
$ver = '0.1';
$mw->withdraw;
$mw->update;
}

    #my $mw = MainWindow->new;

    my $splash = $mw->Splashscreen;
    $splash->Label( -text       => 'Presenting your splash screen ...',
    )->pack(qw/-fill both -expand 1/);
    my $pb = $splash->ProgressBar(-width => 300);
    $pb->pack(qw/-fill both -expand 1/);
    $splash->Label(
        -image => $mw->Photo(
	    -file =>'.\tempsplash.bmp',
	),
    )->pack;
    $splash->Splash;

    my $w = 1;
    while ($w < 100) {
    $pb->set($w);
    $mw->update;
    $mw->after(10);
    $w++;
    } 
     $warning->Popup;
    $splash->Destroy;
 
 
 
 


######subs####

my $crafting =
  $mw->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> 'Crafting Professions', -command => \&crafting )
  ->pack( -anchor => 'w', -expand => 1, -fill => 'both' );
my $harvesting = $mw->Button(-background=> '#0000FF', -activebackground=>'#8000FF',
    -text    => 'Harvesting professions (Includes Handyman profession)',
    -command => \&harvesting
)->pack( -anchor => 'e', -expand => 1, -fill => 'both' );

#remove brackets#
 our (
    $current, $sq1,   $sq2,     $sq3,     $sq4,     $sq5,
    $sq6,     $sq7,   $sq8,     $TER,     $tnl,     $maxslots,
    $line1,   $line2, $line3,   $line4,   $line5,   $line6,
    $line7,   @line8, $line8_1, $line8_2, $line8_3, $line8,
);
our $hundred = 581687;
our $eighty  = 240964;
our $sixty   = 100421;
our $forty   = 36641;
our $twenty  = 8097;
our $entryfield;
our (
    $sevenswords,  $sixswords,    $fiveswords,   $fourswords,   $threeswords,
    $twoswords,    $onesword,     $sevenaxes,    $sixaxes,      $fiveaxes,
    $fouraxes,     $threeaxes,    $twoaxes,      $oneaxe,       $sevendaggers,
    $sixdaggers,   $fivedaggers,  $fourdaggers,  $threedaggers, $twodaggers,
    $onedagger,    $sevenhammers, $sixhammers,   $fivehammers,  $fourhammers,
    $threehammers, $twohammers,   $onehammer,    $sevenshovels, $sixshovels,
    $fiveshovels,  $fourshovels,  $threeshovels, $twoshovels,   $oneshovel,
    $sevenbows,    $sixbows,      $fivebows,     $fourbows,     $threebows,
    $twobows,      $onebow,       $sevenwands,   $sixwands,     $fivewands,
    $fourwands,    $threewands,   $twowands,     $onewand,      $sevenstaff,
    $sixstaff,     $fivestaff,    $fourstaff,    $threestaff,   $twostaff,
    $onestaff,     $sevenshield,  $sixshield,    $fiveshield,   $fourshield,
    $threeshield,  $twoshield,    $oneshield,
);

#remove brackets when done transcribing#
my $top_frame = $mw->Frame( -relief => "groove" )->pack(
    -side => 'top',
    -fill => 'x'
);

my $main_menu = $top_frame->Menu();
$mw->configure( -menu => $main_menu );
my $file_menu = $main_menu->cascade(
    -label     => "File",
    -underline => 0,
    -tearoff   => 0
);
$file_menu->command(
    -label     => "Exit",
    -underline => 0,
    -command   => sub { exit }
);

my $help_menu = $main_menu->cascade(
    -label     => "Help",
    -underline => 0,
    -tearoff   => 0
);

#
$help_menu->command(
    -label     => "Version",
    -underline => 0,
    -command   => sub {
        $mw->messageBox(
            -message => "Version: $ver",
            -type    => "ok"
        );
    }
);

#
$help_menu->command(
    -label     => "About Program",
    -underline => 0,
    -command   => \&show_about
					);

 
    MainLoop;

 
#warning window subscript#
#professions subscripts#
sub swordsmith {
    my $swordsmith = $crafting->Toplevel;
    $swordsmith->geometry("300x270");
    $swordsmith->title("Swordsmith Calculator");

    #xp entering frame
    my $enterxp =
      $swordsmith->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield =
      $swordsmith->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
    my $recipelisting =
      $swordsmith->Frame(-background=>'#0040FF')->pack( -anchor => 'n', -fill => 'x' );

    sub holdxp {
        $current = 0;
        $current = $entryfield->get();
        if ( $current eq "" ) {
            $current = 0;
            &calculator;
        }
        else {

            &calculator;
        }
    }

    sub calculator {
        if ( $current <= $twenty ) {
            $maxslots = 2;
            $TER      = $twenty and $tnl = $TER - $current;
            $sq1      = ceil($tnl);
            $sq2      = ceil( $tnl / 10 );
            $sq3      = ceil(0);
            $sq4      = ceil(0);
            $sq5      = ceil(0);
            $sq6      = ceil(0);
            $sq7      = ceil(0);
            $sq8      = ceil(0);
        }
        elsif ( $current <= $forty ) {
            $maxslots = 4;
            $TER      = $forty and $tnl = $TER - $current;
            $sq1      = ceil($tnl);
            $sq2      = ceil( $tnl / 10 );
            $sq3      = ceil( $tnl / 25 );
            $sq4      = ceil(0);
            $sq5      = ceil(0);
            $sq6      = ceil(0);
            $sq7      = ceil(0);
            $sq8      = ceil(0);
        }
        elsif ( $current <= $sixty ) {
            $maxslots = 5;
            $TER      = $sixty and $tnl = $TER - $current;
            $sq1      = ceil($tnl);
            $sq2      = ceil($tnl) / 10;
            $sq3      = ceil($tnl) / 25;
            $sq4      = ceil($tnl) / 50;
            $sq5      = ceil(0);
            $sq6      = ceil(0);
            $sq7      = ceil(0);
            $sq8      = ceil(0);
        }
        elsif ( $current <= $eighty ) {
            $maxslots = 6;
            $TER      = $eighty and $tnl = $TER - $current;
            $sq1      = ceil(0);
            $sq2      = ceil(0);
            $sq3      = ceil( $tnl / 25 );
            $sq4      = ceil( $tnl / 50 );
            $sq5      = ceil( $tnl / 100 );
            $sq6      = ceil( $tnl / 250 );
            $sq7      = ceil(0);
            $sq8      = ceil(0);
        }
        elsif ( $current <= $hundred ) {
            $maxslots = 7;
            $TER      = $hundred and $tnl = $TER - $current;
            $sq1      = ceil(0);
            $sq2      = ceil(0);
            $sq3      = ceil(0);
            $sq4      = ceil( $tnl / 50 );
            $sq5      = ceil( $tnl / 100 );
            $sq6      = ceil( $tnl / 250 );
            $sq7      = ceil( $tnl / 500 );
            $sq8      = ceil(0);
        }
        else {
            $sq1 = ceil(0);
            $sq2 = ceil(0);
            $sq3 = ceil(0);
            $sq4 = ceil(0);
            $sq5 = ceil(0);
            $sq6 = ceil(0);
            $sq7 = ceil(0);
            $sq8 = ceil(0);
        }
        $line1   = "$sq1 1 slots";
        $line2   = "$sq2 2 slots";
        $line3   = "$sq3 3 slots";
        $line4   = "$sq4 4 slots";
        $line5   = "$sq5 5 slots";
        $line6   = "$sq6 6 slots";
        $line7   = "$sq7 7 slots";
        $line8_1 = "to reach your goal of ";
        $line8_2 = $TER;
        $line8_3 = " total experience.";
        $line8   = "0";
    }

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );
    $sevenswords = $line7 and $sixswords  = $line6;
    $fiveswords  = $line5 and $fourswords = $line4;
    $threeswords = $line3 and $twoswords  = $line2;
    $onesword    = $line1;
    my $slot_1 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "One Slot" )->grid(
        -column => 1,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_2 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Two Slot" )->grid(
        -column => 2,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_3 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Three Slot" )->grid(
        -column => 3,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_4 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Four Slot" )->grid(
        -column => 1,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_5 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Five Slot" )->grid(
        -column => 2,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_6 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Six Slot" )->grid(
        -column => 3,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_7 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Seven Slot" )->grid(
        -column     => 1,
        -row        => 3,
        -sticky     => "nsew",
        -columnspan => 3,
        -ipadx      => 10,
        -ipady      => 15
    );

}
#
sub axesmith {
    my $axesmith = $crafting->Toplevel;
    $axesmith->geometry("300x270");
    $axesmith->title("Axesmith Calculator");

    #xp entering frame
    my $enterxp =
      $axesmith->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield = $axesmith->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
	my $recipelisting =
      $axesmith->Frame( -background=> '#0040FF')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );
    $sevenaxes = $line7 and $sixaxes  = $line6;
    $fiveaxes  = $line5 and $fouraxes = $line4;
    $threeaxes = $line3 and $twoaxes  = $line2;
    $oneaxe    = $line1;
	my $slot_1 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "One Slot" )->grid(
        -column => 1,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_2 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Two Slot" )->grid(
        -column => 2,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_3 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Three Slot" )->grid(
        -column => 3,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_4 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Four Slot" )->grid(
        -column => 1,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_5 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Five Slot" )->grid(
        -column => 2,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_6 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Six Slot" )->grid(
        -column => 3,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_7 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Seven Slot" )->grid(
        -column     => 1,
        -row        => 3,
        -sticky     => "nsew",
        -columnspan => 3,
        -ipadx      => 10,
        -ipady      => 15
    );
}
#
sub tailor {
    my $tailor = $crafting->Toplevel;
    $tailor->geometry("300x270");
    $tailor->title("Tailor Calculator");

    #xp entering frame
    my $enterxp =
      $tailor->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield = $tailor->Frame( -background=> 'white')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );

}
#
sub shovelsmith {
    my $shovelsmith = $crafting->Toplevel;
    $shovelsmith->geometry("300x270");
    $shovelsmith->title("Shovelsmith Calculator");

    #xp entering frame
    my $enterxp =
      $shovelsmith->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield =
      $shovelsmith->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
	  my $recipelisting =
      $shovelsmith->Frame( -background=> '#0040FF')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );
    $sevenhammers = $line7 and $sixhammers  = $line6;
    $fivehammers  = $line5 and $fourhammers = $line4;
    $threehammers = $line3 and $twohammers  = $line2;
    $onehammer    = $line1;
my $slot_1 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "One Slot" )->grid(
        -column => 1,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_2 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Two Slot" )->grid(
        -column => 2,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_3 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Three Slot" )->grid(
        -column => 3,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_4 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Four Slot" )->grid(
        -column => 1,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_5 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Five Slot" )->grid(
        -column => 2,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_6 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Six Slot" )->grid(
        -column => 3,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_7 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Seven Slot" )->grid(
        -column     => 1,
        -row        => 3,
        -sticky     => "nsew",
        -columnspan => 3,
        -ipadx      => 10,
        -ipady      => 15
    );
	}
#
sub daggersmith {
    my $daggersmith = $crafting->Toplevel;
    $daggersmith->geometry("300x270");
    $daggersmith->title("Daggersmith Calculator");

    #xp entering frame
    my $enterxp =
      $daggersmith->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield =
      $daggersmith->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
	  my $recipelisting =
      $daggersmith->Frame( -background=> '#0040FF')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;
    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );
    $sevendaggers = $line7 and $sixdaggers  = $line6;
    $fivedaggers  = $line5 and $fourdaggers = $line4;
    $threedaggers = $line3 and $twodaggers  = $line2;
    $onedagger    = $line1;
	my $slot_1 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "One Slot" )->grid(
        -column => 1,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_2 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Two Slot" )->grid(
        -column => 2,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_3 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Three Slot" )->grid(
        -column => 3,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_4 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Four Slot" )->grid(
        -column => 1,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_5 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Five Slot" )->grid(
        -column => 2,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_6 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Six Slot" )->grid(
        -column => 3,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_7 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Seven Slot" )->grid(
        -column     => 1,
        -row        => 3,
        -sticky     => "nsew",
        -columnspan => 3,
        -ipadx      => 10,
        -ipady      => 15
    );
}
#
sub shoemaker {
    my $shoemaker = $crafting->Toplevel;
    $shoemaker->geometry("300x270");
    $shoemaker->title("Shoemaker Calculator");

    #xp entering frame
    my $enterxp =
      $shoemaker->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield = $shoemaker->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );

}
#
sub shieldsmith {
    my $shieldsmith = $crafting->Toplevel;
    $shieldsmith->geometry("300x270");
    $shieldsmith->title("Shieldsmith Calculator");

    #xp entering frame
    my $enterxp =
      $shieldsmith->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield =
      $shieldsmith->Frame( -background=> 'white')->pack( -anchor => 'n', -fill => 'x' );
	  my $recipelisting =
      $shieldsmith->Frame( -background=> '#0040FF')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );
    $sevenshield = $line7 and $sixshield  = $line6;
    $fiveshield  = $line5 and $fourshield = $line4;
    $threeshield = $line3 and $twoshield  = $line2;
    $oneshield   = $line1;

	my $slot_1 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "One Slot" )->grid(
        -column => 1,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_2 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Two Slot" )->grid(
        -column => 2,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_3 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Three Slot" )->grid(
        -column => 3,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_4 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Four Slot" )->grid(
        -column => 1,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_5 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Five Slot" )->grid(
        -column => 2,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_6 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Six Slot" )->grid(
        -column => 3,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_7 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Seven Slot" )->grid(
        -column     => 1,
        -row        => 3,
        -sticky     => "nsew",
        -columnspan => 3,
        -ipadx      => 10,
        -ipady      => 15
    );
	}
#
sub hammersmith {
    my $hammersmith = $crafting->Toplevel;
    $hammersmith->geometry("300x270");
    $hammersmith->title("Hammersmith Calculator");

    #xp entering frame
    my $enterxp =
      $hammersmith->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield =
      $hammersmith->Frame( -background=> 'white')->pack( -anchor => 'n', -fill => 'x' );
	  my $recipelisting =
      $hammersmith->Frame( -background=> '#0040FF')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );
    $sevenhammers = $line7 and $sixhammers  = $line6;
    $fivehammers  = $line5 and $fourhammers = $line4;
    $threehammers = $line3 and $twohammers  = $line2;
    $onehammer    = $line1;
	my $slot_1 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "One Slot" )->grid(
        -column => 1,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_2 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Two Slot" )->grid(
        -column => 2,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_3 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Three Slot" )->grid(
        -column => 3,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_4 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Four Slot" )->grid(
        -column => 1,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_5 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Five Slot" )->grid(
        -column => 2,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_6 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Six Slot" )->grid(
        -column => 3,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_7 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Seven Slot" )->grid(
        -column     => 1,
        -row        => 3,
        -sticky     => "nsew",
        -columnspan => 3,
        -ipadx      => 10,
        -ipady      => 15
    );
}
#
sub staffcarver {
    my $staffcarver = $crafting->Toplevel;
    $staffcarver->geometry("300x270");
    $staffcarver->title("Hammersmith Calculator");

    #xp entering frame
    my $enterxp =
      $staffcarver->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield =
      $staffcarver->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
	  my $recipelisting =
      $staffcarver->Frame( -background=> '#0040FF')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );
    $sevenstaff = $line7 and $sixstaff  = $line6;
    $fivestaff  = $line5 and $fourstaff = $line4;
    $threestaff = $line3 and $twostaff  = $line2;
    $onestaff   = $line1;
	my $slot_1 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "One Slot" )->grid(
        -column => 1,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_2 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Two Slot" )->grid(
        -column => 2,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_3 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Three Slot" )->grid(
        -column => 3,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_4 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Four Slot" )->grid(
        -column => 1,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_5 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Five Slot" )->grid(
        -column => 2,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_6 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Six Slot" )->grid(
        -column => 3,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_7 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Seven Slot" )->grid(
        -column     => 1,
        -row        => 3,
        -sticky     => "nsew",
        -columnspan => 3,
        -ipadx      => 10,
        -ipady      => 15
    );
}
#
sub bowcarver {
    my $bowcarver = $crafting->Toplevel;
    $bowcarver->geometry("300x270");
    $bowcarver->title("Hammersmith Calculator");

    #xp entering frame
    my $enterxp =
      $bowcarver->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield = $bowcarver->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
	my $recipelisting =
      $bowcarver->Frame( -background=> '#0040FF')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );
    $sevenbows = $line7 and $sixbows  = $line6;
    $fivebows  = $line5 and $fourbows = $line4;
    $threebows = $line3 and $twobows  = $line2;
    $onebow    = $line1;
	my $slot_1 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "One Slot" )->grid(
        -column => 1,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_2 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Two Slot" )->grid(
        -column => 2,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_3 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Three Slot" )->grid(
        -column => 3,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_4 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Four Slot" )->grid(
        -column => 1,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_5 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Five Slot" )->grid(
        -column => 2,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_6 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Six Slot" )->grid(
        -column => 3,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_7 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Seven Slot" )->grid(
        -column     => 1,
        -row        => 3,
        -sticky     => "nsew",
        -columnspan => 3,
        -ipadx      => 10,
        -ipady      => 15
    );
}
#
sub wandcarver {
    my $wandcarver = $crafting->Toplevel;
    $wandcarver->geometry("300x270");
    $wandcarver->title("Hammersmith Calculator");

    #xp entering frame
    my $enterxp =
      $wandcarver->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield =
      $wandcarver->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
	  my $recipelisting =
      $wandcarver->Frame( -background=> '#0040FF')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );
    $sevenwands = $line7 and $sixwands  = $line6;
    $fivewands  = $line5 and $fourwands = $line4;
    $threewands = $line3 and $twowands  = $line2;
    $onewand    = $line1;
	my $slot_1 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "One Slot" )->grid(
        -column => 1,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_2 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Two Slot" )->grid(
        -column => 2,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_3 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Three Slot" )->grid(
        -column => 3,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_4 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Four Slot" )->grid(
        -column => 1,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_5 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Five Slot" )->grid(
        -column => 2,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_6 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Six Slot" )->grid(
        -column => 3,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 10,
        -ipady  => 15
    );
    my $slot_7 = $recipelisting->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Seven Slot" )->grid(
        -column     => 1,
        -row        => 3,
        -sticky     => "nsew",
        -columnspan => 3,
        -ipadx      => 10,
        -ipady      => 15
    );
}
#
sub jeweller {
    my $jeweller = $crafting->Toplevel;
    $jeweller->geometry("300x270");
    $jeweller->title("Jeweller Calculator");

    #xp entering frame
    my $enterxp =
      $jeweller->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield = $jeweller->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;
    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );

}
#
sub farmer {
    my $farmer = $harvesting->Toplevel;
    $farmer->geometry("300x270");
    $farmer->title("Farmer Calculator");

    #xp entering frame
    my $enterxp =
      $farmer->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield = $farmer->Frame( -background=> 'white')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );

}
#
sub miner {
    my $miner = $harvesting->Toplevel;
    $miner->geometry("300x270");
    $miner->title("Miner Calculator");

    #xp entering frame
    my $enterxp =
      $miner->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield = $miner->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;
    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );

}

sub lumberjack {
    my $lumberjack = $harvesting->Toplevel;
    $lumberjack->geometry("300x270");
    $lumberjack->title("Lumberjack Calculator");

    #xp entering frame
    my $enterxp =
      $lumberjack->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield =
      $lumberjack->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );

}
#
sub alchemist {
    my $alchemist = $harvesting->Toplevel;
    $alchemist->geometry("300x270");
    $alchemist->title("Alchemist Calculator");

    #xp entering frame
    my $enterxp =
      $alchemist->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield = $alchemist->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );

}
#
sub handyman {
    my $handyman = $harvesting->Toplevel;
    $handyman->geometry("300x270");
    $handyman->title("Handyman Calculator");

    #xp entering frame
    my $enterxp =
      $handyman->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield = $handyman->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;
    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );

}
#
sub fisherman {
    my $fisherman = $harvesting->Toplevel;
    $fisherman->geometry("300x270");
    $fisherman->title("Fisherman Calculator");

    #xp entering frame
    my $enterxp =
      $fisherman->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield = $fisherman->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );

}
#
sub hunter {
    my $hunter = $harvesting->Toplevel;
    $hunter->geometry("300x270");
    $hunter->title("Hunter Calculator");

    #xp entering frame
    my $enterxp =
      $hunter->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield = $hunter->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );

}
#
sub baker {
    my $baker = $harvesting->Toplevel;
    $baker->geometry("300x270");
    $baker->title("Baker Calculator");

    #xp entering frame
    my $enterxp =
      $baker->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield = $baker->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );

}
#
sub butcher {
    my $butcher = $harvesting->Toplevel;
    $butcher->geometry("300x270");
    $butcher->title("Butcher Calculator");

    #xp entering frame
    my $enterxp =
      $butcher->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield = $butcher->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );

}
#
sub fishmonger {
    my $fishmonger = $harvesting->Toplevel;
    $fishmonger->geometry("300x270");
    $fishmonger->title("Fishmonger Calculator");

    #xp entering frame
    my $enterxp =
      $fishmonger->Frame( -background=>'#0000FF', )
      ->pack( -anchor => 'n', -fill => 'x', );
	  	  my $entrylabel=
	  $enterxp->Label(-background=>'white', -text=>'XP:')->grid(-column=>1,-row=>1);
    $entryfield =
      $enterxp->Entry( -width => 20, -background => "yellow", )
      ->grid( -column => 2, -row => 1 );
    my $holdxp =
      $enterxp->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> "Start Calculator", -command => \&holdxp )
      ->grid( -column => 3, -row => 1 );
    my $outputfield =
      $fishmonger->Frame(-background=>'white')->pack( -anchor => 'n', -fill => 'x' );
    &holdxp;

    my $slotone =
      $outputfield->Label( -background=>'white', -textvariable => \$line1 )
      ->grid( -column => 1, -row => 1, -sticky => "nsew" );
    my $slottwo =
      $outputfield->Label( -background=>'white', -textvariable => \$line2 )
      ->grid( -column => 2, -row => 1, -sticky => "nsew" );
    my $slotthree =
      $outputfield->Label( -background=>'white', -textvariable => \$line3 )
      ->grid( -column => 3, -row => 1, -sticky => "nsew" );
    my $slotfour =
      $outputfield->Label( -background=>'white', -textvariable => \$line4 )
      ->grid( -column => 1, -row => 2, -sticky => "nsew" );
    my $slotfive =
      $outputfield->Label( -background=>'white', -textvariable => \$line5 )
      ->grid( -column => 2, -row => 2, -sticky => "nsew" );
    my $slotsix =
      $outputfield->Label( -background=>'white', -textvariable => \$line6 )
      ->grid( -column => 3, -row => 2, -sticky => "nsew" );
    my $slotseven =
      $outputfield->Label( -background=>'white', -textvariable => \$line7 )
      ->grid( -column => 2, -row => 3, -sticky => "nsew" );
    my $endline1 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_1 )
      ->grid( -column => 1, -row => 4, -sticky => "nsew" );
    my $endline2 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_2 )
      ->grid( -column => 2, -row => 4, -sticky => "nsew" );
    my $endline3 =
      $outputfield->Label( -background=>'white', -textvariable => \$line8_3 )
      ->grid( -column => 3, -row => 4, -sticky => "nsew" );

}
#
#secondary window subscripts#
sub harvesting {
    my $harvester = $mw->Toplevel;
    $harvester->geometry("300x250");
    $harvester->title("Harvesting Professions");
    my $professions1 = $harvester->Frame( -background => '#0040FF' )->pack(
        -anchor => 'w',
        -fill   => 'both',
        -expand => 'yes'
    );
    my $farmer1 =
      $professions1->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> 'Farmer', -command => \&farmer )->grid(
        -column => 1,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 20
      );
    my $miner1 =
      $professions1->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> 'Miner', -command => \&miner )->grid(
        -column => 2,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 20
      );
    my $lumberjack1 =
      $professions1->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> 'Lumberjack', -command => \&lumberjack )
      ->grid(
        -column => 3,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 20
      );
    my $alchemist1 =
      $professions1->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> 'Alchemist', -command => \&alchemist )
      ->grid(
        -column => 1,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 20
      );
    my $fisherman1 =
      $professions1->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> 'Fisherman', -command => \&fisherman )
      ->grid(
        -column => 2,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 20
      );
    my $hunter1 =
      $professions1->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> 'Hunter', -command => \&hunter )->grid(
        -column => 3,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 20
      );
    my $baker1 =
      $professions1->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> 'Baker', -command => \&baker )->grid(
        -column => 1,
        -row    => 3,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 20
      );
    my $butcher1 =
      $professions1->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> 'Butcher', -command => \&butcher )->grid(
        -column => 2,
        -row    => 3,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 20
      );
    my $fishmonger1 =
      $professions1->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> 'Fishmonger', -command => \&fishmonger )
      ->grid(
        -column => 3,
        -row    => 3,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 18
      );
    my $handyman1 =
      $professions1->Button(-activebackground=>'#8000FF', -background=> '#0000FF', -text=> 'Handyman', -command => \&handyman )
      ->grid(
        -column     => 1,
        -row        => 4,
        -sticky     => "nsew",
        -ipadx      => 15,
        -ipady      => 20,
        -columnspan => 3
      );
}

sub crafting {
    my $crafter = $mw->Toplevel;
    $crafter->geometry("300x250");
    $crafter->title("Crafting Professions");
    my $professions1 = $crafter->Frame(-background=>'#0040FF')->pack(
        -anchor => 'w',
        -fill   => 'both',
        -expand => 'yes'
    );

    my $swordsmith1 = $professions1->Button(
        -background=>'#0000FF', -activebackground=>'#8000FF',
        -text       => 'Swordsmith',
        -command    => \&swordsmith,
      )->grid(
        -column => 1,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 15
      );
    my $shovelsmith1 = $professions1->Button(
        -background=>'#0000FF', -activebackground=>'#8000FF',
        -text       => 'Shovelsmith',
        -command    => \&shovelsmith
      )->grid(
        -column => 2,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 15
      );
    my $hammersmith1 = $professions1->Button(
        -background=>'#0000FF', -activebackground=>'#8000FF',
        -text       => 'Hammersmith',
        -command    => \&hammersmith
      )->grid(
        -column => 3,
        -row    => 1,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 15
      );
    my $axesmith1 = $professions1->Button(
        -background=>'#0000FF', -activebackground=>'#8000FF',
        -text       => 'Axesmith',
        -command    => \&axesmith
      )->grid(
        -column => 1,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 15
      );
    my $daggersmith1 = $professions1->Button(
        -background=>'#0000FF', -activebackground=>'#8000FF',
        -text       => 'Daggersmith',
        -command    => \&daggersmith
      )->grid(
        -column => 2,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 15
      );
    my $jeweller1 = $professions1->Button(
        -background=>'#0000FF', -activebackground=>'#8000FF',
        -text       => 'Jeweller',
        -command    => \&jeweller
      )->grid(
        -column => 3,
        -row    => 2,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 15
      );
    my $tailor1 = $professions1->Button(
        -background=>'#0000FF', -activebackground=>'#8000FF',
        -text       => 'Tailor',
        -command    => \&tailor
      )->grid(
        -column => 1,
        -row    => 3,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 15
      );
    my $shoemaker1 = $professions1->Button(
        -background=>'#0000FF', -activebackground=>'#8000FF',
        -text       => 'Shoemaker',
        -command    => \&shoemaker
      )->grid(
        -column => 2,
        -row    => 3,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 15
      );
    my $shieldsmith1 = $professions1->Button(
        -background=>'#0000FF', -activebackground=>'#8000FF',
        -text       => 'Shieldsmith',
        -command    => \&shieldsmith
      )->grid(
        -column => 3,
        -row    => 3,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 15
      );
    my $staffcarver1 = $professions1->Button(
        -background=>'#0000FF', -activebackground=>'#8000FF',
        -text       => 'Staff carver',
        -command    => \&staffcarver
      )->grid(
        -column => 1,
        -row    => 4,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 15
      );
    my $wandcarver1 = $professions1->Button(
        -background=>'#0000FF', -activebackground=>'#8000FF',
        -text       => 'Wand carver',
        -command    => \&wandcarver
      )->grid(
        -column => 2,
        -row    => 4,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 15
      );
    my $bowcarver1 = $professions1->Button(
        -background=>'#0000FF', -activebackground=>'#8000FF',
        -text       => 'Bow carver',
        -command    => \&bowcarver
      )->grid(
        -column => 3,
        -row    => 4,
        -sticky => "nsew",
        -ipadx  => 15,
        -ipady  => 15
      );
}
###################
#&about subroutine#
###################
sub show_about {
    my $help_win = $mw->Toplevel;
    $help_win->geometry("200x125");
    $help_win->title("About Program");
    my $about_frame = $help_win->Frame(-background=>'#0000FF',)->pack(
        -ipadx  => 150,
        -side   => 'top',
        -fill   => 'both',
        -expand => 'yes'
    );
    my $help_msg =
"For help, please see <website>. Additional help can be found at irc.newnet.net channel #brakmarianrose";
    $about_frame->Label(
        -wrap       => 150,
        -text       => $help_msg,
        -background => 'white'
    )->pack( -side => 'top' );
    $about_frame->Button(
        -text    => "Ok",
        -command => [ $help_win => 'destroy' ]
    )->pack( -side => 'bottom' );
}