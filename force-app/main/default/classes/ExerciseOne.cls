public with sharing class ExerciseOne {
    public ExerciseOne() {
            Integer Math = 80;
            Integer Science = 80;
            Integer Average = 0;

            Average = (Math + Science) / 2;
            System.debug(Average);

            String Result = Average >= 75 
                        ? Average >= 75 && Average <=90
                                ? 'Grade a rating and you are passed'
                                    : 'Grade B rating and you are passed'
                            : 'you are failed';
            System.debug(Result);

    }
}
