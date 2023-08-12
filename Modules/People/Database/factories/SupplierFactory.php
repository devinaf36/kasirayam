<?php
namespace Modules\People\Database\factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class SupplierFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = \Modules\People\Entities\Supplier::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'supplier_name' => $this->faker->name(),
            'supplier_email' => $this->faker->safeEmail(),
            'supplier_phone' => $this->faker->phoneNumber(),
            'Kota' => $this->faker->Kota(),
            'Kelurahan' => $this->faker->Kelurahan(),
            'address' => $this->faker->streetAddress()
        ];
    }
}

