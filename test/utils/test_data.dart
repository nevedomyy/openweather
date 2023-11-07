const forecastMock = {
  "cod": "200",
  "message": 0,
  "cnt": 2,
  "list": [
    {
      "dt": 32530500000,
      "main": {
        "temp": 10.0,
        "feels_like": 9.28,
        "temp_min": 10.19,
        "temp_max": 13.07,
        "pressure": 987,
        "sea_level": 987,
        "grnd_level": 988,
        "humidity": 77,
        "temp_kf": -2.88
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {"all": 33},
      "wind": {"speed": 5.71, "deg": 151, "gust": 14.96},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "3000-11-07 12:00:00"
    },
    {
      "dt": 32530586400,
      "main": {
        "temp": 20.0,
        "feels_like": 11.92,
        "temp_min": 12.86,
        "temp_max": 14.92,
        "pressure": 988,
        "sea_level": 988,
        "grnd_level": 985,
        "humidity": 66,
        "temp_kf": -2.06
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 66},
      "wind": {"speed": 5.63, "deg": 151, "gust": 12.02},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "3000-11-08 12:00:00"
    }
  ],
  "city": {
    "id": 2950159,
    "name": "Berlin",
    "coord": {"lat": 52.5244, "lon": 13.4105},
    "country": "DE",
    "population": 1000000,
    "timezone": 3600,
    "sunrise": 1698905013,
    "sunset": 1698939371
  }
};
