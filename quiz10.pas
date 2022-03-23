import random

class QA:
  def __init__(self, question, correctAnswer, otherAnswers):
    self.question = question
    self.corrAnsw = correctAnswer
    self.otherAnsw = otherAnswers

qaList = [QA("Which is the name of the 8th album of heavy metal band Paradise Lost?", "Believe in Nothing", ["Host", "One second"]),
QA("What's the name of the singer of heavy metal giants Paradise Lost ?", "Nick Holmes",[ "Gregor Mackintosh", "Dave Lombardo"]),
QA("What's the name of lead guitarist of heavy metal giants Paradise Lost?", "Gregor Mackintosh", ["Tom Morello","Joe Satriani", "Steve Vai"]),
QA("What's the name of Guns 'n Roses guitarist?", "Slash", ["Joe Satriani", "Steve Vai"]),
QA("Which is Guns 'n Roses first album?", "Appetite for destruction", ["Chinese Democracy", "The spaghetti incident?", "Believe in Nothing", "Images and words"])]

corrCount = 0
random.shuffle(qaList)
for qaItem in qaList:
  print(qaItem.question)
  print("Possible answers are:")
  possible = qaItem.otherAnsw + [qaItem.corrAnsw] # square brackets turn correct answer into list for concatenating with other list
  random.shuffle(possible)
  count = 0 # list indexes start at 0 in python
  while count < len(possible):
    print(str(count+1) + ": " + possible[count])
    count += 1
  print("Please enter the number of your answer:")
  userAnsw = input()
  while not userAnsw.isdigit():
    print("That was not a number. Please enter the number of your answer:")
    userAnsw = input()
  userAnsw = int(userAnsw)
  while not (userAnsw > 0 and userAnsw <= len(possible)):
    print("That number doesn't correspond to any answer. Please enter the number of your answer:")
    userAnsw = input()
  if possible[userAnsw-1] == qaItem.corrAnsw:
    print("Your answer was correct.")
    corrCount += 1
  else:
    print("Your answer was wrong.")
    print("Correct answer was: " + qaItem.corrAnsw)
  print("")

print("You answered " + str(corrCount) + " of " + str(len(qaList)) + " questions correctly.")
