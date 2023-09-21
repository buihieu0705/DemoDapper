using DemoDapper.Models;
using DemoDapper.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DemoDapper.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly ICategoryRepository categoryRepo;

        public CategoryController(ICategoryRepository categoryRepo)
        {
            this.categoryRepo = categoryRepo;
        }
        [HttpGet]
        public async Task<IActionResult> GetCategories()
        {
            try
            {
                var categories = await categoryRepo.GetAll();
                return Ok(categories);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetCategoryById(int id)
        {
            try
            {
                var cat = await categoryRepo.GetById(id);
                if (cat == null) return NotFound();
                return Ok(cat);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        public async Task<IActionResult> CreateCategory(CategoryRequest cat)
        {
            try
            {
                var category = await categoryRepo.Create(cat);
                return Ok(category);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
        [HttpGet("{id}/MultipleResult")]
        public async Task<IActionResult> GetCategoryWithProduct(int id)
        {
            try
            {
                var category = await categoryRepo.GetCategoryWithProducts(id);
                return Ok(category);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteCategory(int id)
        {
            try
            {
                var cat = await categoryRepo.GetById(id);
                if (cat == null) return NotFound();
                await categoryRepo.Delete(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateCategory(int id, CategoryRequest cat)
        {
            try
            {
                var category = await categoryRepo.GetById(id);
                if (category == null) return NotFound();
                await categoryRepo.Update(id, cat);
                return NoContent();

            } catch (Exception ex) {
            return StatusCode(500, ex.Message);
            }
        }


    }
}
