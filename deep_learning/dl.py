import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import LabelEncoder, OneHotEncoder, Imputer, StandardScaler
from sklearn.model_selection import train_test_split
import keras
from keras.models import Sequential
from keras.layers import Dense
from sklearn.metrics import confusion_matrix

#1) Veri Önişleme
#1.1) Veri Yükleme
veriler = pd.read_csv('Churn_Modelling.csv')

X = veriler.iloc[:,3:13].values
Y = veriler.iloc[:,13].values

# LabelEncoder
le = LabelEncoder()
X[:,1] = le.fit_transform(X[:,1])

le2 = LabelEncoder()
X[:,2] = le2.fit_transform(X[:,2])

# OneHotEncoder -> Kolon başlıklarına etiketleri taşır
ohe = OneHotEncoder(categorical_features=[1])
X = ohe.fit_transform(X).toarray()
X = X[:,1:]

# Verilerin train-test olarak bölünmesi
x_train, x_test, y_train, y_test = train_test_split(X, Y, test_size = 0.33, random_state = 0)

# Verilerin ölçeklenmesi - Standartlaştırma
sc = StandardScaler()
X_train = sc.fit_transform(x_train)
X_test = sc.fit_transform(x_test)

# Yapay Sinir Ağı
classifier = Sequential()
classifier.add(Dense(6, init = 'uniform',  activation = 'relu', input_dim = 11)) # giriş katmanı
classifier.add(Dense(6, init = 'uniform',  activation = 'relu'))
classifier.add(Dense(6, init = 'uniform',  activation = 'sigmoid'))

classifier.compile(optimizer = 'adam', loss = 'binary_crossentropy', metrics = ['accuracy']) # optimizasyon

classifier.fit(X_train, y_train, epochs = 50)
y_pred = classifier.predict(X_test)
y_pred = (y_pred > 0.5)

cm = confusion_matrix(y_test, y_pred)
print(cm)















    