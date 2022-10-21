@{
    "Name"                     = "PSO-T0-Accounts"
    "DisplayName"              = "Password Policies Object for tier 0 Accounts"
    "Description"              = "Will be applied to all tier 0 Accounts"
    Precedence                 = 50
    "MinPasswordLength"        = 30
    "SubjectGroup"             = "PSO-Policy-T0-Accounts"
    "LockoutThreshold"         = 5
    "MaxPasswordAge"           = "180d"
    "ComplexityEnabled"        = $true
    "LockoutDuration"          = "30m"
    "LockoutObservationWindow" = "30m"
    "MinPasswordAge"           = "7d"
    "PasswordHistoryCount"     = 48
}