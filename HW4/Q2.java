/**
 * This file generates the points of a spirograph with increments of 0.1 to get a reasonable number of spirograph points.
 */
public class Q2 {
    public static void main(String[] args) {
        double R = 8, r = 1, a = 4;
        double nRev = 16;
        double limit_t = nRev * Math.PI;
        double x, y;
        double t = 0;
        double scalingConstant = 0.001;
        while (t <= limit_t) {
            x = (R + r) * Math.cos((r / R) * t) - a * Math.cos((1 + r / R) * t);
            y = (R + r) * Math.sin((r / R) * t) - a * Math.sin((1 + r / R) * t);
            x = x * scalingConstant;
            y = y * scalingConstant;
            x = -118.28543 + x;
            y = 34.02054 + y;
            System.out.printf("{\"loc\": [%.5f,%.5f]},\n", x, y);
            t += 0.1; // iterations in increments of 0.1 to have a reasonable number of points on the spirograph
        }
    }
}
