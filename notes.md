This is my new Charity Race app that lets Runners track their races and the charity causes they're running for.

MODELS:
    Runners
    Causes
    Races

    Runners
        have_many: causes
        have_many: races
        through: causes
    Causes
        belongs_to: runner
        belongs_to: race
    Races
        have_many: causes
        have_many: races
        through: causes

    Runners
        username :string
        email :string
        password_digest :string

    Causes
        name :string
        runner_id :integer
        race_id :integer

    Races
        name :string
        type :string
        

