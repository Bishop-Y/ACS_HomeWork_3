double function(int x)
{
    double guess = x / 3.0;
    double eps = 0.05;
    double difference = 1.0;
    double res;

    while (difference > eps) {
        res = (2.0 * guess + 1.0 * x / (guess * guess)) / 3.0;
        if (res - guess < 0) {
            difference = -1.0 * (res - guess);
        }
        else {
            difference = (res - guess);
        }
        guess = res;
    }

    return res;
}
