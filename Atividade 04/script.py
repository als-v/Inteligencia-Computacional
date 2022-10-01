from sklearn.neighbors import KNeighborsClassifier
from sklearn import metrics
import numpy as np

def runKnn(MAX_K, X_train, y_train, X_teste, y_teste):

    range_k = np.arange(1, MAX_K, 1)
    scores = {}

    for k in range_k:
        knn = KNeighborsClassifier(n_neighbors=k)
        knn.fit(X_train, y_train)
        y_pred = knn.predict(X_teste)

        scores[k] = metrics.accuracy_score(y_teste, y_pred)
    
    return scores, range_k