#!/usr/bin/env python3
from random import shuffle


lesson = 28
print("Please keep learning Pimsleur Japanese")

learned = list(range(lesson))

shuffle(learned)

review = learned[:5]
review.sort()
print("Please review the following lessons today:")
for i in review:
    print("lessonn " + str(i+1))


