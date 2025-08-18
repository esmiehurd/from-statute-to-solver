from z3 import *

# Define offense predicates
fdm = Bool('fdm')  # First-degree murder
sdm = Bool('sdm')  # Second-degree murder
vm = Bool('vm')    # Voluntary manslaughter
im = Bool('im')    # Involuntary manslaughter
cs = Bool('cs')    # Conspiracy/Solicitation

# Recklessness predicates
reckless = Bool('reckless')
reckless_transportation = Bool('reckless_transportation')

# Offenses involving valuables
payment = Bool('payment')

# Offenses involving the death of the victim
death = Bool('death')

# Define offense level
offense_level = Int('offense_level')

s = Solver()

# Set up offense parameters
offense_user = input("Offense number (2A1._): ")
if int(offense_user) == 1:
    s.add(death)
    s.add(fdm)
if int(offense_user )== 2:
    s.add(death)
    s.add(sdm)
if int(offense_user) == 3:
    s.add(death)
    s.add(vm)
if int(offense_user) == 4:
    s.add(death)
    s.add(im)
    reckless_user = input("Did the offense involve reckless conduct? (y/n) ")
    if reckless_user == 'y':
        s.add(reckless)
        reckless_transportation_user = input("Did the reckless conduct involve a mode of transportaion? (y/n) ")
        if reckless_transportation_user == 'y':
            s.add(reckless_transportation)
        else:
            s.add(Not(reckless_transportation))
    else:
        s.add(Not(reckless))
if int(offense_user) == 5:
    s.add(cs)
    death_user = input("Did the offense result in the death of a victim? (y/n) ")
    if death_user == 'y':
        s.add(death)
    else:
        s.add(Not(death))
        payment_user = input("Did the offense involve the offer of anything of value for undertaking the murder? (y/n) ")
        if payment_user == 'y':
            s.add(payment)
        else:
            s.add(Not(payment))

# Base offense levels
s.add(Implies(fdm, offense_level == 43)) # BOL for fdm is always 43

s.add(Implies(sdm, offense_level == 38)) # BOL for sdm is always 38

s.add(Implies(vm, offense_level == 29)) # BOL for vm is always 29

s.add(Implies(im, 
    # If not reckless, BOL for im is 12
    If(Not(reckless), offense_level == 12, 
        # If reckless but no mode of transportation involved, BOL for im is 18
        If(Not(reckless_transportation), offense_level == 18, 
            # If reckless and mode of transportation involved, BOL for im is 22
            offense_level == 22)))) 

s.add(Implies(cs,
    # If cs involved death of the victim, it's fdm
    If(death, fdm,
        # If no valuables involved, BOL for cs is 33
        If(Not(payment), offense_level == 33,
            # if valuables involved, BOL for cs is 37
            offense_level == 37))))

# Check satisfiability and get model
if s.check() == sat:
    print(s.model())
else:
    print("No valid sentencing found.")