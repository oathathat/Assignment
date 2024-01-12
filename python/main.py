from utility.extractData import GetPredictedGenderData

if __name__ == "__main__":
    get_predicted_gender_data = GetPredictedGenderData()
    data = get_predicted_gender_data.getData(samples=20)
    print(data)