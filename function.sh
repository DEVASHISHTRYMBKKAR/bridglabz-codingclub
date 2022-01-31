IPLYEAR=2021
MATCHES_PLAYED=14
win=0
lose=0
points=0
position=0
runRate=""
rcbTeam=('Siraj' 'Abd' 'Virat')
miTeam=('Rohit' 'Bumrah' 'Suryakumar')

echo "Please Select Your Favourite Team In IPL $IPLYEAR"
echo "CSK RCB MI SRH DC KKR PBKS RR"
read teamName
     function message() {
              echo "$1 Is a $3 Of $2"
     }

     function rolesAndResponsibility() {
              if [ $1 == 'RCB' ]
              then
                      for player in ${rcbTeam[@]}
                      do
                          if [ $player == "Abd" ]
                          then
                              message $player $1 'Batsman'
                          elif [ $player == "Virat" ]
                          then
                              message $player $1 'Captain'
                          else
                              message $player $1 'Bowler'
                          fi
                      done
              elif [ $1 == 'MI' ]
              then
                      for player in ${miTeam[@]}
                      do
                          if [ $player == "Suryakumar" ]
                          then
                              message $player $1 'Batsman'
                          elif [ $player == "Rohit" ]
                          then
                              message $player $1 'Captain'
                          else
                              message $player $1 'Bowler'
                          fi
                      done
              fi
     }
     function playoff() {
              if [ $1 -le 4 ]
              then
                  echo "$2 Is Eligilbe For PlayOffs :)"
              else
                  echo "$2 Is Not Eligilbe For PlayOffs :("
              fi
     }
     function errorHandler() {
              echo "Your Given Input Is Invalid :("
              echo "Please Try Again ..."
     }
     function pointsCalculator() {
              lose=$((MATCHES_PLAYED-$1))
              points=$(($1*2))
              echo "********************************"
              echo "IPL $IPLYEAR"
              echo "Team Name Is : $teamName"
              echo "Place Secured : $3"
              echo "Played Matches : $MATCHES_PLAYED"
              echo "Won : $1 , Lost : $lose"
              echo "NRR : $2"
              echo "Points : $points"
              echo "********************************"
              playoff $3 $teamName
              rolesAndResponsibility $teamName
     }

             if [ $teamName == 'RCB' ]
             then
                        position=3
             elif [ $teamName == 'MI' ]
             then
                        position=5
             elif [ $teamName == 'CSK' ]
             then
                        position=2
             else
                 errorHandler
             fi

 case $position in
   5)
      win=7
      runRate="+0.116"
      pointsCalculator $win $runRate $position
      ;;
   3)
      win=9
      runRate="-0.140"
      pointsCalculator $win $runRate $position
      ;;
   2)
      win=9
      runRate="+0.455"
      pointsCalculator $win $runRate $position
      ;;
   *)

     ;;
 esac