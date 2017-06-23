# SVM Score = 0.69378

fit.SVM <- train(Survived~Pclass + Sex + Age + SibSp + Parch + Fare +
                            Embarked + Title + FamilySize + FamilyID, 
                    data=train, 
                    method="svmRadial",
                    trControl=trainControl(method = "cv",number = 5))
print(fit.SVM)
Prediction_SVM <- predict(fit.SVM, test, OOB=TRUE)
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction_SVM)
write.csv(submit, file = "SVM.csv", row.names = FALSE)