{config, lib, pkgs, ... }:

{
  services = {
    supergfxd.enable = false;
    asusd = {
      enable = true;
      enableUserService = true;
      fanCurvesConfig = ''
        (
            balanced: [
                (
                    fan: CPU,
                    pwm: (29, 74, 86, 99, 107, 234, 233, 235),
                    temp: (11, 40, 52, 58, 62, 67, 70, 98),
                    enabled: true,
                ),
                (
                    fan: GPU,
                    pwm: (29, 30, 98, 198, 204, 218, 217, 255),
                    temp: (10, 29, 46, 56, 67, 75, 87, 100),
                    enabled: true,
                ),
            ],
            performance: [
                (
                    fan: CPU,
                    pwm: (253,253,253,253,253,253,253,253,253,253),
                    temp: (10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                    enabled: true,
                ),
                (
                    fan: GPU,
                    pwm: (253,253,253,253,253,253,253,253,253,253),
                    temp: (10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                    enabled: true,
                ),
            ],
            quiet: [
                (
                    fan: CPU,
                    pwm: (10, 20, 20, 35, 35, 51, 71, 86),
                    temp: (53, 56, 56, 59, 59, 63, 67, 98),
                    enabled: true,
                ),
                (
                    fan: GPU,
                    pwm: (20, 30, 30, 45, 45, 68, 79, 99),
                    temp: (53, 56, 56, 59, 59, 63, 67, 98),
                    enabled: true,
                ),
            ],
        )
        '';
    };
  };
}
