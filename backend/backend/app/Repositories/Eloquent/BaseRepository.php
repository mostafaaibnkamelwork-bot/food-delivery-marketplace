<?php

namespace App\Repositories\Eloquent;

use App\Repositories\Contracts\BaseRepositoryInterface;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;

abstract class BaseRepository implements BaseRepositoryInterface
{
    public function __construct(protected Model $model) {}
    public function all(): Collection { return $this->model->newQuery()->get(); }
    public function find(int $id): ?Model { return $this->model->newQuery()->find($id); }
    public function create(array $data): Model { return $this->model->newQuery()->create($data); }
    public function update(Model $model, array $data): Model { $model->fill($data)->save(); return $model; }
}
