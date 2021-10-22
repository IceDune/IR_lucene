import matplotlib.pyplot as plt
import numpy as np

# for classic similarity
analyzers = ['simple analyzer', 'whitespace analyzer', 'standard analyzer',
            'english analyzer', 'custom analyzer']

mapScores = [0.3503, 0.2884, 0.34,0.3826,0.3171]
iprec = [0.3455,0.2791,0.3415,0.3745,0.3079]

# plot graphs
xAxis = np.arange(len(analyzers))

fig = plt.figure()
plt.bar(xAxis - 0.2, mapScores, 0.4, label="MAP scores")
plt.bar(xAxis + 0.2, iprec, 0.4, label="iPrec")
plt.xticks(xAxis, analyzers)
plt.xlabel("Analyzers")
plt.ylabel("Score")
plt.title("Plot of different analyzers for classic similarity")
plt.legend()
plt.show()

# for LMDirilich similarity
analyzers = ['simple analyzer', 'whitespace analyzer', 'standard analyzer',
            'english analyzer']

mapScores = [0.3431,0.3077,0.3423, 0.3518]
iprec = [0.3425,0.3018,0.3428,0.3584]

# plot graphs
xAxis = np.arange(len(analyzers))

fig = plt.figure()
plt.bar(xAxis - 0.2, mapScores, 0.4, label="MAP scores")
plt.bar(xAxis + 0.2, iprec, 0.4, label="iPrec")
plt.xticks(xAxis, analyzers)
plt.xlabel("Analyzers")
plt.ylabel("Score")
plt.title("Plot of different analyzers for LMDirilich similarity")
plt.legend()
plt.show()

# for bm25 similarity
analyzers = ['simple analyzer', 'whitespace analyzer', 'standard analyzer',
            'english analyzer', 'custom analyzer']

mapScores = [0.4052,0.3658,0.4046,0.4288,0.3507]
iprec = [0.4224,0.3732,0.4202,0.4385,0.3507]

# plot graphs
xAxis = np.arange(len(analyzers))

fig = plt.figure()
plt.bar(xAxis - 0.2, mapScores, 0.4, label="MAP scores")
plt.bar(xAxis + 0.2, iprec, 0.4, label="iPrec")
plt.xticks(xAxis, analyzers)
plt.xlabel("Analyzers")
plt.ylabel("Score")
plt.title("Plot of different analyzers for bm25 similarity")
plt.legend()
plt.show()