from sklearn.neighbors import KNeighborsClassifier
from sklearn import metrics
import pandas as pd
import numpy as np

columnsHU = [
    'Nome', 
    'H1',
    'H2',
    'H3',
    'H4',
    'H5',
    'H6',
    'H7',
    'Classe'
]

classes = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9'
]

def runKnn(MAX_K, X_train, y_train, X_teste, y_teste):

    range_k = np.arange(1, MAX_K, 1)
    scores = {}

    for k in range_k:
        knn = KNeighborsClassifier(n_neighbors=k)
        knn.fit(X_train, y_train)
        y_pred = knn.predict(X_teste)

        scores[k] = metrics.accuracy_score(y_teste, y_pred)
    
    return scores, range_k

def generateDic(CV, CH):
    columnsPixel = []

    for idx in np.arange(0, (CV*CH), 1):
        if idx == 0:
            columnsPixel.append('Nome')

        columnsPixel.append(idx)

        if idx+1 == (CV*CH):
            columnsPixel.append('Classe')

    dic = {
        'result_HU_': columnsHU,
        'result_Pixels_': columnsPixel
    }

    return dic


def generateDataframe(dic, treino=True):
    label = 'treino' if treino else 'teste'

    dataHu = pd.DataFrame(columns=dic['result_HU_'])
    dataPixels = pd.DataFrame(columns=dic['result_Pixels_'])

    for result in dic.keys():

        for classe in classes:
            
            path = f'result/{label}/{result}{classe}.txt'
            newData = pd.read_csv(path, sep=' ', names=dic[result])
            
            if result == 'result_HU_':
                dataHu = pd.concat([dataHu, newData], keys=dic[result], ignore_index=True)
            else:
                dataPixels = pd.concat([dataPixels, newData], keys=dic[result], ignore_index=True)

    return dataHu, dataPixels

def returnTrainTest(data):
    X_train = []
    y_train = []

    for idx, nome in enumerate(data['Nome'].unique().tolist()):
        dataValue = data[data['Nome'] == nome]
        X_train.append([])

        for values in dataValue.values.tolist():
            for v in values[1:8]:
                X_train[idx].append(v)

        y_train.append(dataValue['Classe'].values[0])
        
    return X_train, y_train
