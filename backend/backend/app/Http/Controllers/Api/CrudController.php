<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Concerns\CrudResponses;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

abstract class CrudController extends Controller
{
    use CrudResponses;

    /** @var class-string<Model> */
    protected string $model;
    protected array $with = [];
    protected array $storeRules = [];
    protected array $updateRules = [];

    public function index(Request $request): JsonResponse
    {
        $query = $this->model::query()->with($this->with)->latest('id');
        return $this->ok($query->paginate((int) $request->integer('per_page', 20)));
    }

    public function show(int|string $id): JsonResponse
    {
        return $this->ok($this->model::query()->with($this->with)->findOrFail($id));
    }

    public function store(Request $request): JsonResponse
    {
        $data = $request->validate($this->storeRules);
        return $this->created($this->model::query()->create($data));
    }

    public function update(Request $request, int|string $id): JsonResponse
    {
        $model = $this->model::query()->findOrFail($id);
        $model->fill($request->validate($this->updateRules ?: $this->storeRules))->save();
        return $this->ok($model->fresh($this->with));
    }

    public function destroy(int|string $id): JsonResponse
    {
        $this->model::query()->findOrFail($id)->delete();
        return response()->json(status: 204);
    }
}
