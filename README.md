<h1>Titanic Survivor Prediction competition on Kaggle</h1> 

<i>On April 15, 1912, the RMS Titanic sank resulting in the loss of 1502 out of 2224 passengers and crew.  </i>  

<i>The goal here is to complete the analysis of what sorts of people were likely to survive in this disaster. </i>  

<i>We can use the tools of machine learning to predict which passengers survived the tragedy.</i>    

<i>This project is based on two datasets of train and test. The train dataset is of 891 items with 12 variables, and we want to make prediction on "survived" of test dataset.  </i>

Following is an exhibition of my work.  
  
<a href="#1">1. Feature engineering, all kinds of modeling and predictions</a>  
<a href="#2">2. Visualization to show who are survivors</a>    


<a name="1"> </a>  
<h5>1. Feature engineering, different kinds of modeling and predictions </h5>    
  
<a href="#top" target="_self">Back to top</a>   
About data cleanning and feature engineering, currently I am doing no better than an excellent <a href="https://www.kaggle.com/mrisdal/titanic/exploring-survival-on-the-titanic"> tutorial </a>.   
My exhibition focus on how to build different models and their prediction scores on Kaggle public leaderboard. Here I tried four types of models that are commonly used for classification:Lasso, randomForest, SVM and Xgboost. Among them, Lasso showed the  highest score.
<pre>  
<b># Lasso score =  0.80383</b>
set.seed(12)
fit.glmnet <- train(Survived~Pclass + Sex + Age + SibSp + Parch + Fare +
                            Embarked + Title + FamilySize + FamilyID, 
                    data=train, 
                    method="glmnet",
                    trControl=trainControl(method = "cv",number = 5))
print(fit.glmnet)
Prediction_l <- predict(fit.glmnet, test, OOB=TRUE)
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction_l)
write.csv(submit, file = "Lasso.csv", row.names = FALSE)
</pre>  
<pre> 
<b># randomForest score = 0.77512 </b>

fit.rf <- train(Survived~Pclass + Sex + Age + SibSp + Parch + Fare +
                            Embarked + Title + FamilySize + FamilyID, 
                    data=train, 
                    method="rf",
                    trControl=trainControl(method = "cv",number = 5))
print(fit.rf)

Prediction_rf <- predict(fit.rf, test, OOB=TRUE)
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction_rf)
write.csv(submit, file = "RandomForest.csv", row.names = FALSE)
</pre>  
<pre> 
<b># SVM Score = 0.69378</b>

fit.SVM <- train(Survived~Pclass + Sex + Age + SibSp + Parch + Fare +
                            Embarked + Title + FamilySize + FamilyID, 
                    data=train, 
                    method="svmRadial",
                    trControl=trainControl(method = "cv",number = 5))
print(fit.SVM)
Prediction_SVM <- predict(fit.SVM, test, OOB=TRUE)
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction_SVM)
write.csv(submit, file = "SVM.csv", row.names = FALSE)
</pre>  
<pre> 
<b># Xgboost Score = 0.77033</b>

fit.XGB <- train(Survived~Pclass + Sex + Age + SibSp + Parch + Fare +
                         Embarked + Title + FamilySize + FamilyID, 
                 data=train, 
                 method="xgbTree",
                 trControl=trainControl(method = "cv",number = 5))
print(fit.XGB)
Prediction_XGB <- predict(fit.XGB, test, OOB=TRUE)
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction_XGB)
write.csv(submit, file = "XGB.csv", row.names = FALSE)  
</pre>  
<a name="2"> </a>  
<h5>2. Visualization to show who are survivors </h5>  
  
<a href="#top" target="_self">Back to top</a>   
To better explain those who have bigger chances to survive, I made these pictures with Tableau.

<p align=center><img src="https://github.com/mxc19912008/readme_pics/blob/master/image/Sex.jpg" width="700" ></p> 
<p>Interms of sexuality, most females survived while most males did not make it.</p>  , 
<p align=center><img src="https://github.com/mxc19912008/readme_pics/blob/master/image/Age.jpg" width="500"></p>    
<p>Interms of age, individuals under 18 years old have more than 50% of chances to surivive, among which babies(who are 0-2 years old) are most likely to survive.</p>
<p>Individuals over 18 years old, or adults have less than 50% of chances to surivive, among which seniles(who are over 60 years old) are most unlikely to survive.</p>  
<p>For youth(18-40 years old) and midlifes(41-60), they have similiar probability to live, which is around 43-44%.</p>
<p align=center><img src="https://github.com/mxc19912008/readme_pics/blob/master/image/Economic.jpg" width="500"></p>    
<p>Interms of economic status, for lower class individuals who are take up major part of all, they have only 24.2% chances to survive.</p>
<p>For for middle class individuals, they have 47.3% chances to live.</p> 
<p>While for rich people, they are most likely to survive, which is up to 63.0%.  </p> 
<p align=center><img src="https://github.com/mxc19912008/readme_pics/blob/master/image/Family Size.jpg" width="300"></p>   <p>Interms of family size, middle sized families(4-6 people) have 47.3% chances to survive, big families(7-11 people) have only 16.0% to break out, while small families(2-3 people), including single individual(1 person), surprisingly have 38.9% chances to survive.</p> 
<p>   </p> 
<a href="https://public.tableau.com/views/Titanic_296/AGE?:embed=y&:useGuest=true&:display_count=yes"> You can also see the interactive visualization here.</a>  </p> 

  
<p> This my current ranking of this competition on Kaggle. See, still a lot to be improved.</p> 

<p align=center><img src="https://github.com/mxc19912008/readme_pics/blob/master/image/Titanic ranking.png" width="500"></p>  
<a href="#top" target="_self">Back to top</a>  
