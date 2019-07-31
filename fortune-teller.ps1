##################################################################################################
# fortune-teller.ps1
# Teo Espero
# Cloud and Systems Administration (BS)
# Western Governors University
#
# This game project is the PowerShell Fortune Teller game. This game simulates a
# session with a virtual fortune teller who listens to player questions and then provides answers.
# The answers provided vary based on the fortune teller’s mood, which changes based on the
# time of day that questions are asked. All questions are expected to be posed in such a way
# that yes/no answers can be applied.
##################################################################################################

## declare our vars

$question = ""    ## This variable will store the player's question
$status = "Play"  ## This variable will be used to control game termination
$answer = 0       ## This variable stores a randomly generated number

$randomNo = New-Object System.Random ## This variable stores a random object
$time = (Get-Date).Hour ## This variable stores the current hour of the day

## display the game's opening screen

Clear-Host

## display the game's opening screen

Write-Host
Write-Host
Write-Host "           ==================================================================="
Write-Host
Write-Host "                       W E L C O M E   T O   T H E   W I N D O W S"
Write-Host
Write-Host
Write-Host          
Write-Host "                    P O W E R S H E L L   F O R T U N E   T E L L E R"
Write-Host
Write-Host
Write-Host
Write-Host "                                        By Teo Espero"
Write-Host
Write-Host "           ==================================================================="
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host " Press Enter to continue."

## Pause the script execution and wait for the player to press the Enter key
Read-Host


## provide player instructions

Clear-Host

Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host "           The fortune teller is a very busy and impatient mystic. Make"
Write-Host
Write-Host "            your questions brief and simple and only expect to receive"
Write-Host
Write-host "                            Yes / No styled answers."
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host " Press Enter to continue."

## Pause the script execution and wait for the player to press the Enter key
Read-Host


## Continue gameplay until the player decides to stop

while ($status -ne "Stop") {
    ## Ask the player the first question

    while ($question -eq ""){
        Clear-Host 

        Write-Host
        $question = read-host " What is your question? "
    }
    $question = "" #Reset variable to an empty string
 
    ## Retrieve a random number between 1 and 4
    $answer = $randomNo.Next(1,5)

    ## Select an answer based on the time and the random number

    ## If it is the afternoon the fortune teller will be a little cranky
    if ($time -gt 12) {
        Write-Host
        if ($answer -eq 1) { " Grrrr. The answer is no!" }
        if ($answer -eq 2) { " Grrrr. The answer is never!" }
        if ($answer -eq 3) { " Grrrr. The answer is unclear!" }
        if ($answer -eq 4) { " Grrrr. The answer is yes!" }
    }

    ## If it is morning, the fortune teller will be in a good mood
    else {
        Write-Host
        if ($answer -eq 1) { " Ah. The answer is yes!" }
        if ($answer -eq 2) { " Ah. The answer is always!" }
        if ($answer -eq 3) { " Ah. The answer is uncertain!" }
        if ($answer -eq 4) { " Ah. The answer is no!" }
    }

    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host " Press Enter to continue."

    ## Pause script execution and wait for the player to press the Enter key

    Read-Host

    Clear-host


    Write-Host
    
    ## Prompt the player to continue or quit

    $reply = read-host " Press Enter to ask another question or type Q to quit."

    ## note that Q and q are treated as the same, -eq as designed is not 
    ## case sensitive 

    if ($reply -eq "q") { $status = "Stop" }
}


## Show credits 

Clear-Host

Write-Host
Write-Host
Write-Host 
Write-Host
Write-Host 
Write-Host
Write-Host
Write-Host "                                   The PowerShell Fortune Teller"
Write-Host 
Write-Host "             Copyright 2019 - Teo Espero, Cloud and Systems Administration (BS)"
Write-Host "                                   Western Governors University"
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host
Write-Host 

## create a 5-second delay before returning the player to the command shell

Start-Sleep -Seconds 3

Clear-Host

##################################################################################################
## EOF 